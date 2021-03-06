
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
    year int not null,
    description varchar(255) default null,
    foreign key(author) references authors(id)
) character set=utf8;

insert into authors(name) 
    values ('Станислав Лем');

insert into authors(name)
    values('Аркадий и Борис Стругацкие');

insert into authors(name)
    values('Александр Беляев');

insert into authors(name)
    values('Владимир Ленин');

insert into authors(name)
    values('Роджер Желязны');

insert into books(title, author, year) 
    values ('Молох', 1, 2006);

insert into books(title, author, year)
    values('Солярис', 1, 1960);

update books 
    set year=1961 where id=2;

insert into books(title, author, year)
    values('Пикник на обочине', 2, 1972);

insert into books(title, author, year)
    values('Челове-амфибия', 3, 1928);

insert into books(title, author, year)
    values('Трудно быть богом', 2, 1963);

insert into books(title, author, year)
    values('Полное собрание сочинений', 4, 1967);

insert into books(title, author, year)
    values('Хроники Амбера', 5, 1991);


-- delete from books
--    where id=6;

-- delete from authors
--    where name='Владимир Ленин';

select * from authors;
select * from books;

select title, name from books, authors where books.author=authors.id;

