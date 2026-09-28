// archivo: iinventoryservice.cs
// función: define las operaciones que debe ofrecer el servicio de inventario.

using AbarrotesInventory.Domain.Entities;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Application.Interfaces;
// interfaz que define las operaciones disponibles sin indicar su implementación.
public interface IInventoryService { Task<List<Product>> GetProductsAsync(); Task<Product?> GetProductAsync(int id); Task SaveProductAsync(Product p); Task DeleteProductAsync(int id); Task<List<Category>> GetCategoriesAsync(); Task<List<Supplier>> GetSuppliersAsync(); Task<List<Customer>> GetCustomersAsync(); Task<DashboardDto> DashboardAsync(); Task RegisterSaleAsync(Sale sale); Task RegisterPurchaseAsync(Purchase purchase); }
public record DashboardDto(int Products,int LowStock,int Categories,int Suppliers,int Customers,decimal SalesToday,decimal PurchasesToday);
