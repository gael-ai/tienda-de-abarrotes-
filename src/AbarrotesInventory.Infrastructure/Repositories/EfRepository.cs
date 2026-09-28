// archivo: efrepository.cs
// función: implementa operaciones comunes de acceso a datos mediante entity framework core.

using Microsoft.EntityFrameworkCore; using AbarrotesInventory.Application.Interfaces; using AbarrotesInventory.Infrastructure.Data; using AbarrotesInventory.Domain.Entities;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Infrastructure.Repositories;
// clase principal de este archivo.
public class EfRepository<T>(AppDbContext db):IRepository<T> where T:class { public Task<List<T>> ListAsync()=>db.Set<T>().AsNoTracking().ToListAsync(); public Task<T?> GetAsync(int id)=>db.Set<T>().FindAsync(id).AsTask(); public Task AddAsync(T e)=>db.Set<T>().AddAsync(e).AsTask(); public void Update(T e)=>db.Set<T>().Update(e); }
public class UnitOfWork(AppDbContext db):IUnitOfWork { public IRepository<Product> Products{get;}=new EfRepository<Product>(db); public IRepository<Category> Categories{get;}=new EfRepository<Category>(db); public IRepository<Supplier> Suppliers{get;}=new EfRepository<Supplier>(db); public IRepository<Customer> Customers{get;}=new EfRepository<Customer>(db); public IRepository<Sale> Sales{get;}=new EfRepository<Sale>(db); public IRepository<Purchase> Purchases{get;}=new EfRepository<Purchase>(db); public IRepository<InventoryMovement> Movements{get;}=new EfRepository<InventoryMovement>(db); public Task<int> SaveAsync()=>db.SaveChangesAsync(); }
