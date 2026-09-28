-- archivo: schema.sql
-- función: crea la base de datos, sus tablas, relaciones y datos iniciales para la tienda de abarrotes.

CREATE DATABASE IF NOT EXISTS AbarrotesInventoryDB
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE AbarrotesInventoryDB;

-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Roles (Id INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(80) NOT NULL UNIQUE);
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Users (Id INT AUTO_INCREMENT PRIMARY KEY, Username VARCHAR(80) NOT NULL UNIQUE, PasswordHash VARCHAR(255) NOT NULL, FullName VARCHAR(150) NOT NULL, Email VARCHAR(150), Active BOOLEAN NOT NULL DEFAULT TRUE, RoleId INT NOT NULL, CONSTRAINT FK_Users_Roles FOREIGN KEY (RoleId) REFERENCES Roles(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Categories (Id INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(120) NOT NULL, Description VARCHAR(500), Active BOOLEAN NOT NULL DEFAULT TRUE);
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Suppliers (Id INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(150) NOT NULL, TaxId VARCHAR(30), Phone VARCHAR(30), Email VARCHAR(150), Address VARCHAR(250), Active BOOLEAN NOT NULL DEFAULT TRUE);
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Customers (Id INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(150) NOT NULL, Document VARCHAR(30), Phone VARCHAR(30), Email VARCHAR(150), Address VARCHAR(250), Active BOOLEAN NOT NULL DEFAULT TRUE);
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Products (Id INT AUTO_INCREMENT PRIMARY KEY, Code VARCHAR(50) NOT NULL UNIQUE, Name VARCHAR(150) NOT NULL, CategoryId INT NOT NULL, PurchasePrice DECIMAL(18,2) NOT NULL, SalePrice DECIMAL(18,2) NOT NULL, Stock INT NOT NULL DEFAULT 0, MinStock INT NOT NULL DEFAULT 0, Unit VARCHAR(20) NOT NULL DEFAULT 'UND', ExpirationDate DATETIME NULL, Active BOOLEAN NOT NULL DEFAULT TRUE, CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Purchases (Id INT AUTO_INCREMENT PRIMARY KEY, Number VARCHAR(50) NOT NULL UNIQUE, Date DATETIME NOT NULL, SupplierId INT NOT NULL, UserId INT NOT NULL, Total DECIMAL(18,2) NOT NULL, Status VARCHAR(30) NOT NULL, CONSTRAINT FK_Purchases_Suppliers FOREIGN KEY (SupplierId) REFERENCES Suppliers(Id), CONSTRAINT FK_Purchases_Users FOREIGN KEY (UserId) REFERENCES Users(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS PurchaseDetails (Id INT AUTO_INCREMENT PRIMARY KEY, PurchaseId INT NOT NULL, ProductId INT NOT NULL, Quantity INT NOT NULL, UnitCost DECIMAL(18,2) NOT NULL, Subtotal DECIMAL(18,2) NOT NULL, CONSTRAINT FK_PurchaseDetails_Purchases FOREIGN KEY (PurchaseId) REFERENCES Purchases(Id) ON DELETE CASCADE, CONSTRAINT FK_PurchaseDetails_Products FOREIGN KEY (ProductId) REFERENCES Products(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Sales (Id INT AUTO_INCREMENT PRIMARY KEY, Number VARCHAR(50) NOT NULL UNIQUE, Date DATETIME NOT NULL, CustomerId INT NOT NULL, UserId INT NOT NULL, Subtotal DECIMAL(18,2) NOT NULL, Tax DECIMAL(18,2) NOT NULL, Total DECIMAL(18,2) NOT NULL, PaymentMethod VARCHAR(30) NOT NULL, Status VARCHAR(30) NOT NULL, CONSTRAINT FK_Sales_Customers FOREIGN KEY (CustomerId) REFERENCES Customers(Id), CONSTRAINT FK_Sales_Users FOREIGN KEY (UserId) REFERENCES Users(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS SaleDetails (Id INT AUTO_INCREMENT PRIMARY KEY, SaleId INT NOT NULL, ProductId INT NOT NULL, Quantity INT NOT NULL, UnitPrice DECIMAL(18,2) NOT NULL, Subtotal DECIMAL(18,2) NOT NULL, CONSTRAINT FK_SaleDetails_Sales FOREIGN KEY (SaleId) REFERENCES Sales(Id) ON DELETE CASCADE, CONSTRAINT FK_SaleDetails_Products FOREIGN KEY (ProductId) REFERENCES Products(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS InventoryMovements (Id INT AUTO_INCREMENT PRIMARY KEY, ProductId INT NOT NULL, Date DATETIME NOT NULL, Type VARCHAR(30) NOT NULL, Quantity INT NOT NULL, StockBefore INT NOT NULL, StockAfter INT NOT NULL, Reference VARCHAR(80), Notes VARCHAR(500), CONSTRAINT FK_InventoryMovements_Products FOREIGN KEY (ProductId) REFERENCES Products(Id));
-- crea la tabla if y define sus campos y relaciones.
CREATE TABLE IF NOT EXISTS Payments (Id INT AUTO_INCREMENT PRIMARY KEY, SaleId INT NOT NULL, Date DATETIME NOT NULL, Amount DECIMAL(18,2) NOT NULL, Method VARCHAR(30) NOT NULL, CONSTRAINT FK_Payments_Sales FOREIGN KEY (SaleId) REFERENCES Sales(Id) ON DELETE CASCADE);

INSERT IGNORE INTO Roles (Id, Name) VALUES (1,'ADMINISTRADOR'), (2,'CAJERO');
INSERT IGNORE INTO Users (Id,Username,PasswordHash,FullName,Email,RoleId) VALUES (1,'admin','admin123','Administrador','admin@local',1);
INSERT IGNORE INTO Categories (Id,Name,Description) VALUES (1,'Abarrotes','Productos de consumo'),(2,'Bebidas','Bebidas y refrescos'),(3,'Limpieza','Productos de limpieza');
INSERT IGNORE INTO Suppliers (Id,Name,TaxId,Phone,Email,Address) VALUES (1,'Distribuidora Principal','20123456789','999111222','proveedor@local.com','Lima');
INSERT IGNORE INTO Customers (Id,Name,Document,Phone,Email,Address) VALUES (1,'Cliente General','00000000','999000000','cliente@local.com','Lima');
INSERT IGNORE INTO Products (Id,Code,Name,CategoryId,PurchasePrice,SalePrice,Stock,MinStock,Unit) VALUES (1,'P001','Arroz 1kg',1,3.20,4.50,50,10,'UND'),(2,'P002','Azúcar 1kg',1,3.00,4.20,40,10,'UND');
