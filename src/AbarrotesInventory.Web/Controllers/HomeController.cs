// archivo: homecontroller.cs
// función: controla la página principal y los datos mostrados en el dashboard.

using Microsoft.AspNetCore.Mvc; using Microsoft.AspNetCore.Authorization; using AbarrotesInventory.Application.Interfaces; namespace AbarrotesInventory.Web.Controllers; [Authorize] public class HomeController(IInventoryService s):Controller { public async Task<IActionResult> Index()=>View(await s.DashboardAsync()); }