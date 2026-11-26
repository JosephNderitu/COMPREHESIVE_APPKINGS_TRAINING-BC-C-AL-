namespace StudentPortal.Services;

public class BusinessCentralOptions
{
    public const string SectionName = "BusinessCentral";

    public string BaseUrl { get; set; } = string.Empty;
    public string CompanyId { get; set; } = string.Empty;
    public string CompanyName { get; set; } = string.Empty;
    public string ApiRoute { get; set; } = "api/university/registry/v1.0";
    public string StudentEntitySet { get; set; } = "student";
    public string AuthService { get; set; } = "PortalAuth";

    // Optional. Empty means "use the account the portal runs as" (development).
    public string? ServiceUser { get; set; }
    public string? ServicePassword { get; set; }
    public string? ServiceDomain { get; set; }
}