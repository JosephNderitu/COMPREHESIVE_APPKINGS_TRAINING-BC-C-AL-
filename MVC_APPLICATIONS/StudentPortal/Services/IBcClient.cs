using StudentPortal.Models;

namespace StudentPortal.Services;

public interface IBcClient
{
    /// <summary>Returns the login result, or null when BC rejects the login.</summary>
    /// <exception cref="BcUnavailableException">BC could not be reached or answered with an error.</exception>
    Task<LoginResult?> ValidateLoginAsync(string username, string password, CancellationToken ct = default);
}