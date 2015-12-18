use northwind;
show tables;
drop view if exists `Current Product List`;
describe Products;

create or replace view `Current Product List` as
select ProductID, ProductName, CategoryName
	from Products, Categories
    where  Discontinued="No" and Products.CategoryID=Categories.CategoryID;
    
select * from `Current Product List` limit 5;

INSERT INTO Salespeople (city, cname, comm, cnum) 
VALUES ('San Jose', 'Blanco', NULL, 1100); 

INSERT INTO Multicust 
SELECT * 
 FROM Salespeople 
 WHERE 1 < 
   (SELECT COUNT (*) 
       FROM Customers 
       WHERE Customers.snum = Salespeople.snum); 