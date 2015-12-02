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
    values('Harry', 34, 80),
          ('Sally', 28, 64),
          ('George', 29, 70),
          ('Helena', 54, 54),
          ('Peter', 34, 80);

create table Characters like People;

insert into Characters(name, age, weight)
    values('Daffy', 24, 19), 
          ('Donald', 25, 23),
          ('Scrooge', 81, 27),
          ('George', 29, 70),
          ('Sally', 28,	64);
