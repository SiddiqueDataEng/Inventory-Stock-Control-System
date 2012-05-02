/*
 * Inventory & Stock Control System
 * Project #3 - Real-time Inventory Tracking
 * SQL Server 2008, Triggers, Indexing
 * Created: 2011
 */

USE master;
GO
CREATE DATABASE InventoryDB;
GO
USE InventoryDB;
GO

CREATE TABLE dbo.Warehouses (
    WarehouseID INT IDENTITY(1,1) PRIMARY KEY,
    WarehouseCode VARCHAR(10) UNIQUE NOT NULL,
    WarehouseName VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    ManagerName VARCHAR(100),
    IsActive BIT DEFAULT 1
);

CREATE TABLE dbo.ProductCategories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryCode VARCHAR(20) UNIQUE NOT NULL,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE dbo.Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductCode VARCHAR(30) UNIQUE NOT NULL,
    ProductName VARCHAR(200) NOT NULL,
    CategoryID INT NOT NULL,
    UnitPrice DECIMAL(18,2),
    ReorderLevel INT DEFAULT 10,
    ReorderQuantity INT DEFAULT 50,
    UnitOfMeasure VARCHAR(20),
    FOREIGN KEY (CategoryID) REFERENCES dbo.ProductCategories(CategoryID)
);

CREATE TABLE dbo.Stock (
    StockID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    QuantityOnHand INT DEFAULT 0,
    QuantityReserved INT DEFAULT 0,
    QuantityAvailable AS (QuantityOnHand - QuantityReserved),
    LastUpdated DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID),
    UNIQUE (ProductID, WarehouseID)
);

CREATE TABLE dbo.StockMovements (
    MovementID INT IDENTITY(1,1) PRIMARY KEY,
    MovementDate DATETIME DEFAULT GETDATE(),
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    MovementType VARCHAR(20) NOT NULL, -- IN, OUT, TRANSFER, ADJUSTMENT
    Quantity INT NOT NULL,
    ReferenceNumber VARCHAR(50),
    Notes VARCHAR(255),
    CreatedBy VARCHAR(50),
    FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID)
);

CREATE TABLE dbo.StockAlerts (
    AlertID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    WarehouseID INT NOT NULL,
    AlertType VARCHAR(20) NOT NULL, -- LOW_STOCK, OUT_OF_STOCK, OVERSTOCK
    AlertDate DATETIME DEFAULT GETDATE(),
    IsResolved BIT DEFAULT 0,
    FOREIGN KEY (ProductID) REFERENCES dbo.Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses(WarehouseID)
);

-- Trigger: Auto-generate stock alerts
CREATE TRIGGER trg_CheckStockLevels
ON dbo.Stock
AFTER UPDATE
AS
BEGIN
    INSERT INTO dbo.StockAlerts (ProductID, WarehouseID, AlertType)
    SELECT i.ProductID, i.WarehouseID, 'LOW_STOCK'
    FROM inserted i
    INNER JOIN dbo.Products p ON i.ProductID = p.ProductID
    WHERE i.QuantityAvailable <= p.ReorderLevel
    AND NOT EXISTS (
        SELECT 1 FROM dbo.StockAlerts a 
        WHERE a.ProductID = i.ProductID 
        AND a.WarehouseID = i.WarehouseID 
        AND a.IsResolved = 0
    );
END
GO

CREATE INDEX IX_Stock_Product ON dbo.Stock(ProductID);
CREATE INDEX IX_StockMovements_Date ON dbo.StockMovements(MovementDate);
PRINT 'Inventory Database created successfully';
GO
