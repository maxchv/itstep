
use northwind;
CREATE OR REPLACE VIEW `Current Product List` AS
    SELECT ProductID, ProductName, CategoryName FROM Products, Categories
    WHERE  Discontinued="No" AND Products.CategoryID=Categories.CategoryID;

select * from `Current Product List` limit 5;
select ProductID, ProductName, Discontinued from Products limit 5;
SELECT
`Current Product List`.`ProductID`,
`Current Product List`.`ProductName`,
`Current Product List`.`CategoryName`
FROM `northwind`.`Current Product List`;

update `Current Product List` 
    set ProductName='Chaii'
    where ProductID=1;

update Products
    set ProductName='Chai'
    where ProductID=1;

update `Current Product List`
    set Discontinued=0
    where ProductID=1;

drop database if exists Orders;
create database if not exists Orders;
use Orders;

drop table if exists Salespeople;
# ====================  ТАБЛИЦА 1:  ПРОДАВЦЫ  ================ 
CREATE TABLE if not exists Salespeople 
(
	snum   integer NOT NULL PRIMARY KEY, 
	sname  char(15) CHECK (sname BETWEEN 'AA' AND 'MZ'), 
	city   char(15), 
	comm   decimal(3,2) NOT NULL DEFAULT 0.10
); 

insert into Salespeople(snum, sname, city, comm)
	values(1001, "Peel", "London", .12),
		  (1002, "Serres", "San Jose", .13),
          (1004, "Motika", "London", .11),
          (1007, "Rifkin", "Barcelona", .15),
		  (1003, "Axelrod", "New York", .10);

select * from Salespeople;

# 2. Создайте представление которое бы показывало количество продавцов в каждом городе.
 CREATE OR REPLACE VIEW Citynumber AS 
	SELECT city, COUNT(DISTINCT snum) 
         FROM Salespeople 
         GROUP BY city; 
         
select * from Citynumber;
drop view if exists Citynumver;

drop table if exists Customers;
# ==================  ТАБЛИЦА 2:  ЗАКАЗЧИКИ  ===============
CREATE TABLE if not exists Customers 
(
	cnum   integer primary key, 
	cname  char(10), 
	city    char(10), 
	rating  integer, 
	snum   integer
);

insert into Customers(cnum, cname, city, rating, snum)
	values(2001, "Hoffman"   ,"London",   100 ,1001),
		  (2002 , "Giovanni" ,"Rome",     200 ,1003),
		  (2003 , "Liu"      ,"SanJose",  200 ,1002),
		  (2004 , "Grass"    ,"Berlin" ,  300 ,1002),
		  (2006 , "Clemens"  ,"London" ,  100 ,1001),
		  (2008 , "Cisneros" ,"SanJose",  300 ,1007),
		  (2007 , "Pereira"  ,"Rome"   ,  100 ,1004);

select * from Customers;

# 1. Создайте представление которое бы показывало заказчиков
#   (таблица Customers) которые имеют наивысший рейтинг (rating).
CREATE OR REPLACE VIEW Highratings AS 
	SELECT * FROM Customers 
    WHERE rating=(SELECT max(rating) FROM Customers);

select * from Highratings;

drop view if exists Highratings;

CREATE TABLE Orders 
(	
	onum   integer NOT NULL PRIMARY KEY, 
	amt    decimal, 
	odate  date NOT NULL, 
	cnum  integer NOT NULL UNIQUE, 
	snum  integer NOT NULL UNIQUE	
); 

CREATE TABLE Cityorders 
(
	onum   integer NOT NULL PRIMARY KEY, 
	amt    decimal(4, 2), 
	cnum  integer, 
	snum  integer, 
	city   char (15), 
	FOREIGN KEY (onum, amt, snum) REFERENCES Orders (onum, amt, snum), 
	FOREIGN KEY (cnum, city) REFERENCES Customers (cnum, city) 
); 


use northwind;
select * from `Product Sales for 1997`;

        SELECT      ShippedDate,
            Orders.OrderID,
         Subtotal
        FROM Orders, `Order Subtotals`
        WHERE Orders.OrderID = `Order Subtotals`.OrderID
        AND Orders.ShippedDate IS NOT NULL;
select count(*) from `Summary of Sales by Year`;