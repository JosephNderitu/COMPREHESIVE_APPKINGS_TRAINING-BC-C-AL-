using System.ComponentModel.DataAnnotations;

namespace StudentPortal.Models;

public class LoginViewModel
{
    [Required(ErrorMessage = "Enter your username.")]
    [StringLength(30)]
    public string Username { get; set; } = string.Empty;

    [Required(ErrorMessage = "Enter your password.")]
    [DataType(DataType.Password)]
    public string Password { get; set; } = string.Empty;
}