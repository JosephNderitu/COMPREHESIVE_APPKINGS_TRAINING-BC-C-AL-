using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace StudentPortal.Controllers;

[Authorize]
public class PortalController : Controller
{
    public IActionResult Dashboard()
    {
        // The student number comes from the signed cookie, never from the URL.
        ViewData["StudentNo"] = User.FindFirstValue(ClaimTypes.NameIdentifier);
        ViewData["MustChange"] = User.FindFirstValue("must_change_password");
        return View();
    }
}