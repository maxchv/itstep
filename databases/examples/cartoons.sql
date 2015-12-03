drop database if exists Cartoons;

create database Cartoons;

use Cartoons;

create table Cartoons
(
    id_cartoon      int auto_increment primary key,
    name_cartoon    text not null
) character set=utf8;

insert into Cartoons(name_cartoon)
    values('The Simpsons'),
          ('Family Guy'),
          ('Duck Tales');

create table Chanels
(
    id_chanel      int auto_increment primary key,
    name_chanel    text not null
) character set=utf8;

insert into Chanels(name_chanel)
    values('1+1'),
          ('СТБ'),
          ('Интер');

create table CartoonsChanels
(
    id_cartoon      int not null,
    name_cartoon    text not null,
    name_chanel    text not null
) character set=utf8;

insert into CartoonsChanels
    values(0, 'The Simpsons', 'Inter'),
          (0, 'The Simpsons', '1+1'),
          (0, 'The Simpsons', 'СТБ'),
          (1, 'Family Guy', 'Inter'),
          (1, 'Family Guy', '1+1'),          
          (2, 'Duck Tales', 'СТБ'),
          (2, 'Duck Tales', '1+1');

drop table if exists Chanels;
create table Chanels
(
    name_chanel    text not null
) character set=utf8;

insert into Chanels(name_chanel)
    values('Inter'), ('1+1');
     








