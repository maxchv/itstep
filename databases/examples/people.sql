drop database if exists People;

-- создаем базу данных 
create database People;

use People;

create table People
(
    id int auto_increment primary key,
    name varchar(50) not null,
    age int not null,
    weight int not null
) character set=utf8;

insert into People(name, age, weight)
    values('Harry', 34, 80);

insert into People(name, age, weight)
    values('Sally', 28, 64);

insert into People(name, age, weight)
    values('George', 29, 70);

insert into People(name, age, weight)
    values('Helena', 54, 54);

insert into People(name, age, weight)
    values('Peter', 34, 80);
