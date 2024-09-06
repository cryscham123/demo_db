CREATE LOGIN application WITH PASSWORD = 'QkrQkrdl!@#4';
CREATE DATABASE CMS;
GO

USE CMS;
GO

CREATE USER app_cms FOR LOGIN application;
ALTER ROLE db_datareader ADD MEMBER app_cms;
ALTER ROLE db_datawriter ADD MEMBER app_cms;
GO

-- password는 암호화해서 저장
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT ck_price CHECK (Price >= 0),
    CONSTRAINT ck_stock CHECK (StockQuantity >= 0)
);
GO

-- amount가 StockQuantity 넘어가는지 체크
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    Amount INT NOT NULL,
    CONSTRAINT fk_customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT fk_products FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    CONSTRAINT ck_amount CHECK (Amount > 0)
);
GO
