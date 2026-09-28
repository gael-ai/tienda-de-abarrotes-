// archivo: customerscontroller.cs
// función: controla el registro y consulta de clientes.

using Microsoft.AspNetCore.Authorization;using Microsoft.AspNetCore.Mvc;using AbarrotesInventory.Application.Interfaces;using AbarrotesInventory.Domain.Entities;using AbarrotesInventory.Infrastructure.Data;using Microsoft.EntityFrameworkCore;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Web.Controllers; [Authorize] public class CustomersController(IInventoryService s,AppDbContext db):Controller { public async Task<IActionResult> Index()=>View(await s.GetCustomersAsync()); [HttpPost] public async Task<IActionResult> Save(Customer e){if(e.Id==0)db.Add(e);else db.Update(e);await db.SaveChangesAsync();return RedirectToAction(nameof(Index));} [HttpPost] public async Task<IActionResult> Delete(int id){var e=await db.Set<Customer>().FindAsync(id);if(e!=null){e.Active=false;await db.SaveChangesAsync();}return RedirectToAction(nameof(Index));} }
