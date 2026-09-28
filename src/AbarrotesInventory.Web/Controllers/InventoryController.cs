// archivo: inventorycontroller.cs
// función: controla la consulta de movimientos y estado del inventario.

using AbarrotesInventory.Infrastructure.Data; using Microsoft.AspNetCore.Authorization; using Microsoft.AspNetCore.Mvc; using Microsoft.EntityFrameworkCore;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Web.Controllers; [Authorize] public class InventoryController(AppDbContext db):Controller { public async Task<IActionResult> Index(string? q){var x=db.InventoryMovements.Include(m=>m.Product).AsQueryable();if(!string.IsNullOrWhiteSpace(q))x=x.Where(m=>m.Product!.Name.Contains(q)||m.Product.Code.Contains(q)||m.Reference!.Contains(q));return View(await x.OrderByDescending(m=>m.Date).Take(500).ToListAsync());}}