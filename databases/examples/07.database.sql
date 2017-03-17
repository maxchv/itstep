CREATE TABLE if not exists Salespeople 
(
	snum   integer NOT NULL PRIMARY KEY auto_increment, 
	sname  char(15) CHECK (sname BETWEEN 'AA' AND 'MZ'), 
	city   varchar(15), 
	comm   decimal(3,2) NOT NULL DEFAULT 0.10
); 

insert into Salespeople(snum, sname, city, comm)
	values(1001, "Peel", "London", .12),
		  (1002, "Serres", "San Jose", .13),
          (1004, "Motika", "London", .11),
          (1007, "Rifkin", "Barcelona", .15),
		  (1003, "Axelrod", "New York", .10);

select * from Salespeople;

# ==================  ТАБЛИЦА 2:  ЗАКАЗЧИКИ  ===============
CREATE TABLE if not exists Customers 
(
	cnum   integer primary key auto_increment, 
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

