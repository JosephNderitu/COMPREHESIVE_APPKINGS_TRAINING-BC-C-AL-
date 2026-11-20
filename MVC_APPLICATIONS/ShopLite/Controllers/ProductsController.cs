using Microsoft.AspNetCore.Mvc;
using ShopLite.Models;

namespace ShopLite.Controllers;

public class ProductsController : Controller
{
    public IActionResult Index()
    {
        var products = new List<Product>
        {
            new() { Id = 1, Name = "Laptop", Price = 850m },
            new() { Id = 2, Name = "Headphones", Price = 45m },
            new() { Id = 3, Name = "Keyboard", Price = 30m }
        };

        return View(products);
    }
}