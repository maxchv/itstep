use AdventureWorks2012;

-- Уникальные строки
select distinct StoreID, TerritoryID
from Sales.Customer
order by StoreID;
go

-- Простое CASE выражение
select ProductID, Name, ProductSubCategoryID,
    case ProductSubCategoryID
        when 1 then 'Beverages'
        else 'Unknown Category'
    end
from Production.Product
go

-- Inner Join
SELECT SOH.SalesOrderID, 
             SOH.OrderDate, 
             SOD.ProductID, 
             SOD.UnitPrice, 
             SOD.OrderQty
FROM Sales.SalesOrderHeader AS SOH 
INNER JOIN Sales.SalesOrderDetail AS SOD 
ON SOH.SalesOrderID = SOD.SalesOrderID;

-- Left Outer Join

SELECT CUST.CustomerID, 
		CUST.StoreID, 
		ORD.SalesOrderID, 
		ORD.OrderDate
FROM Sales.Customer AS CUST
LEFT OUTER JOIN Sales.SalesOrderHeader AS ORD
ON CUST.CustomerID = ORD.CustomerID
WHERE ORD.SalesOrderID IS NULL;

-- Использование самосоединения

SELECT  EMP.EmpID, EMP.LastName,
        EMP.JobTitle, EMP.MgrID, MGR.LastName
FROM    HumanResources.Employee AS EMP
INNER JOIN HumanResources.Employee AS MGR 
ON EMP.MgrID = MGR.EmpID ;


-- Выборка первых 20 строк
SELECT TOP (20)  SalesOrderID, CustomerID, TotalDue
FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC;






