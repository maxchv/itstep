create database tclex;
use tclex;
create table students
(
    STUDENT_ID int auto_increment primary key,
    NAME varchar(30) not null,
    ST_CLASS int not null
);

insert into students(NAME, ST_CLASS)
    values('Neena Kochhar', 9),
          ('Lex De Haan',   9),
          ('Alexander Hunold', 11);

update students 
    set st_class=10 where student_id=3;

rollback work;

select * from students;

begin work;
delete from students where student_id=2;
commit work;

lock tables students read;
unlock tables;
-- select last_insert_id();
