// archivo: paymentscontroller.cs
// función: controla el registro y consulta de pagos.

using AbarrotesInventory.Infrastructure.Data; using Microsoft.AspNetCore.Authorization; using Microsoft.AspNetCore.Mvc; using Microsoft.EntityFrameworkCore;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Web.Controllers; [Authorize] public class PaymentsController(AppDbContext db):Controller { public async Task<IActionResult> Index()=>View(await db.Payments.Include(x=>x.Sale).OrderByDescending(x=>x.Date).ToListAsync());}