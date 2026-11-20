namespace ShopLite.Models;

public class Product
{
    public int Id { get; set; }          // EF Core treats "Id" as the primary key by convention
    public string Name { get; set; } = string.Empty;
    public decimal Price { get; set; }
}