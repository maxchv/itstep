create database if not exists db5;
use db5;
drop table if exists t1;
create table t1 (s1 int);
insert into t1 values(5);
delimiter //
drop procedure if exists p1;//
create procedure p1() select * from t1; //
call p1 () ;//
drop procedure if exists p2;//
create procedure p2() select current_date, rand() from t1;//

call p2();//

create function foo(d int) returns int
begin
    return d*d;
end//

select foo(s1) from t1//

