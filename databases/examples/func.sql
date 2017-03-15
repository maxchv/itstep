-- create database products default character set utf8;
-- use products;

/*create table product
(
  id int primary key auto_increment,
  name varchar(256),
  count int default 0,
  price decimal(5, 2)
);*/
/*
insert into product(name, count, price) values
  ('Snikers', 5, 16.5),
  ('Spanch bob', 10, 66.5),
  ('Mars', 15, 26.5);*/
-- select  sum(count*price) as sum, max(price), sum(count*price)/count(count), avg(count*price) as arg from product;

-- select id from product order by id desc limit 1;
-- select max(id) from product;
-- insert into product(name, price) values('Barbi', 12.0);
-- select last_insert_id() from product limit 1;

select * from product where id = (select max(id) from product);


