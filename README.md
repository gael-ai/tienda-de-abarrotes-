# Tienda de Abarrotes Inventory - ASP.NET Core MVC + MySQL

Sistema web de inventario y ventas para Tienda de Abarrotes, construido en .NET 8 con arquitectura por capas.

## Módulos
- Login por cookies y roles
- Dashboard empresarial
- Productos, categorías, proveedores y clientes
- Compras con incremento automático de stock
- Ventas con validación y descuento automático de stock
- Kardex / movimientos de inventario
- Registro de pagos por venta
- Alertas de stock mínimo
- 12 tablas MySQL

## Configuración
1. Ejecutar `database/schema.sql` en MySQL Workbench si la base aún no existe.
2. Editar `src/AbarrotesInventory.Web/appsettings.json` y reemplazar `TU_CONTRASENA_MYSQL`.
3. Abrir `AbarrotesInventory.sln` en Visual Studio 2022.
4. Restaurar paquetes NuGet.
5. Establecer `AbarrotesInventory.Web` como proyecto de inicio y ejecutar.

Usuario demo: `admin` / `admin123`.

> Nota: el entorno usado para preparar este ZIP no dispone del SDK de .NET, por lo que la compilación final debe ejecutarse en Visual Studio. El proyecto conserva .NET 8 y Pomelo.EntityFrameworkCore.MySql 8.0.3.


## versión comentada

el código fuente incluye comentarios explicativos en minúscula. `appsettings.json` se mantiene como json válido y se agregó `appsettings_explicado.txt` para explicar cada parte sin afectar la ejecución.
