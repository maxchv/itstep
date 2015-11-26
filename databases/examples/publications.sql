-- create database publications;
-- use publications;
-- create table publishers
-- (
--     pub_id int not null auto_increment primary key,
--     publisher varchar(255) not null,
--     url varchar(255)
-- );
-- 
-- create table titles
-- (
--     title_id int not null auto_increment primary key,
--     title varchar(255) not null,
--     yearpub int,
--     pub_id int references publications(pub_id)
-- );

-- create table wwwsites
-- (
--     site_id int auto_increment primary key,
--     site varchar(255) not null unique,
--     url varchar(255) not null
-- );

-- create table authors
-- (
--     au_id int auto_increment primary key,
--     author varchar(255) not null unique
-- );

-- create table titleauthors
-- (
--     au_id int not null references authors(au_id),
--     title_id int not null references titles(title_id)
-- );

-- create table wwwsiteauthors
-- (
--     au_id int not null references autors(au_id),
--     site_id int not null references wwwsites(site_id)
-- );

-- use students;
-- alter table students
--    add column `date birth` date null after id;
    
-- alter table students 
--     modify column name varchar(50);
-- 
-- alter table students
--     drop column `group`;
-- 
-- use publications;
-- select * from authors;

drop database if exists books;

create database if not exists books;

use books;

drop table if exists authors;

create table authors
(
    id int auto_increment not null primary key,
    name varchar(255) unique
) character set=utf8;

drop table if exists books;

create table books
(
    id int auto_increment not null primary key,
    title varchar(255) not null,
    author int not null,
    year int,
    description varchar(255) default null,
    foreign key(id) references authors(id)
) character set=utf8;

insert into authors(name) 
    values ('Станислав Лем');

insert into books(title, author, year) 
    values ("Молох", 1, 2006);

select * from authors;
select * from books;

select title, author from books, authors where author=authors.id