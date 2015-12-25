show procedure status;
show create procedure northwind.CustOrderHist;
create database d1;
use d1;
drop table if exists t1;
create table t1
(
    id int auto_increment primary key,
    title varchar(255),
    description varchar(255)
);
insert into t1(title, description)
    values('main', 'main page'),
          ('contacrts', 'contacts page'),
          ('links', 'links page');

delimiter $$
drop procedure get_title$$
create procedure get_title(in _id int, out _title varchar(255))
begin
    select title into _title from t1 where id=_id;
end$$

delimiter ;

set @title = '';
call get_title(1, @title);
select @title;

use classicmodels;
show tables;


DELIMITER $$
 
CREATE PROCEDURE GetCustomerShipping(
 in  p_customerNumber int(11), 
 out p_shiping        varchar(50))
BEGIN
    DECLARE customerCountry varchar(50);
 
    SELECT country INTO customerCountry
 FROM customers
 WHERE customerNumber = p_customerNumber;
 
    CASE customerCountry
 WHEN  'USA' THEN
    SET p_shiping = '2-day Shipping';
 WHEN 'Canada' THEN
    SET p_shiping = '3-day Shipping';
 ELSE
    SET p_shiping = '5-day Shipping';
 END CASE;
 
END$$
delimiter ;

