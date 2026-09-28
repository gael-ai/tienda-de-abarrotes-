// archivo: iunitofwork.cs
// función: define el contrato para coordinar el acceso a los repositorios y guardar cambios en la base de datos.

using AbarrotesInventory.Domain.Entities;
// espacio de nombres que organiza las clases del proyecto.
namespace AbarrotesInventory.Application.Interfaces;
// interfaz que define las operaciones disponibles sin indicar su implementación.
public interface IRepository<T> where T:class { Task<List<T>> ListAsync(); Task<T?> GetAsync(int id); Task AddAsync(T e); void Update(T e); }
public interface IUnitOfWork { IRepository<Product> Products{get;} IRepository<Category> Categories{get;} IRepository<Supplier> Suppliers{get;} IRepository<Customer> Customers{get;} IRepository<Sale> Sales{get;} IRepository<Purchase> Purchases{get;} IRepository<InventoryMovement> Movements{get;} Task<int> SaveAsync(); }
