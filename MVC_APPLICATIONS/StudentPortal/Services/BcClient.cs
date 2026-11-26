using System.Net.Http.Json;
using System.Text.Json;
using Microsoft.Extensions.Options;
using StudentPortal.Models;

namespace StudentPortal.Services;

public class BcClient : IBcClient
{
    private static readonly JsonSerializerOptions JsonOptions = new(JsonSerializerDefaults.Web);

    private readonly HttpClient _http;
    private readonly BusinessCentralOptions _options;
    private readonly ILogger<BcClient> _logger;

    public BcClient(HttpClient http, IOptions<BusinessCentralOptions> options, ILogger<BcClient> logger)
    {
        _http = http;
        _options = options.Value;
        _logger = logger;
    }

    public async Task<LoginResult?> ValidateLoginAsync(string username, string password, CancellationToken ct = default)
    {
        var url = $"ODataV4/{_options.AuthService}_ValidateLogin?company={Uri.EscapeDataString(_options.CompanyName)}";

        string body;
        try
        {
            using var response = await _http.PostAsJsonAsync(url, new { username, password }, ct);
            body = await response.Content.ReadAsStringAsync(ct);

            if (!response.IsSuccessStatusCode)
            {
                _logger.LogError("BC login call failed with HTTP {Status}. Response: {Body}",
                    (int)response.StatusCode, Truncate(body));
                throw new BcUnavailableException($"Business Central returned HTTP {(int)response.StatusCode}.");
            }
        }
        catch (HttpRequestException ex)
        {
            _logger.LogError(ex, "Could not reach Business Central at {BaseUrl}.", _options.BaseUrl);
            throw new BcUnavailableException("Business Central could not be reached.", ex);
        }
        catch (TaskCanceledException ex) when (!ct.IsCancellationRequested)
        {
            _logger.LogError(ex, "The call to Business Central timed out.");
            throw new BcUnavailableException("The call to Business Central timed out.", ex);
        }

        string? value;
        try
        {
            using var doc = JsonDocument.Parse(body);
            value = doc.RootElement.TryGetProperty("value", out var v) ? v.GetString() : null;
        }
        catch (JsonException ex)
        {
            _logger.LogError(ex, "BC returned a reply that is not valid JSON: {Body}", Truncate(body));
            throw new BcUnavailableException("Business Central returned an unreadable reply.", ex);
        }

        if (string.IsNullOrWhiteSpace(value))
        {
            _logger.LogInformation("BC rejected the login for username {Username}.", username);
            return null;
        }

        var result = JsonSerializer.Deserialize<LoginResult>(value, JsonOptions);
        if (result is null || string.IsNullOrWhiteSpace(result.StudentNo))
        {
            _logger.LogError("BC accepted the login but the result could not be read: {Value}", Truncate(value));
            throw new BcUnavailableException("Business Central returned an unreadable login result.");
        }

        _logger.LogInformation("BC accepted the login for {StudentNo}.", result.StudentNo);
        return result;
    }

    private static string Truncate(string text) => text.Length > 300 ? text[..300] : text;
}