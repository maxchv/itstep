create database using_dml;
use using_dml;
create table t1
(
	id int identity primary key,
	data nvarchar(10)
)

insert into t1(data) 
values (N'first'),(N'second'),(N'third'),(N'fourth');

create table t2
(
	id int identity primary key,
	data nvarchar(10)
)

-- вставка данных из одной таблицы в другую
insert into t2(data)
select data from t1 where id>2;

select * from t2;

-- вставка данных с созданием таблицы
select id, data 
into t3
from t1 where id>1;

select * from t3;


-- identity
create table t4
(
	id int identity(100, 50) primary key,
	data nvarchar(10)
)

insert into t4(data) 
values (N'first'),(N'second'),(N'third'),(N'fourth');

select max(id) from t4;
select top 1 id from t4 order by id desc;
select @@IDENTITY;

-- sequences
create table t5
(
	id int,
	some_int int	
)

alter table t5
add constraint constaint_id_primary_key
primary key(id);

create sequence dbo.seq_id as int start with 0 increment by 1; 
create sequence seq_some_int as int start with 100 increment by 50;

insert into t5(id, some_int)
values (next value for seq_id, 
        next value for seq_some_int);
select * from t5;

CREATE TABLE Orders
(
	OrderID int PRIMARY KEY DEFAULT (NEXT VALUE FOR dbo.seq_id),
    Name varchar(20) NOT NULL,
    Qty int NOT NULL
)

insert into Orders (Name, Qty)
values ('TV', 2), ('Apple', 2);

select * from Orders;

update Orders
set Qty=15
where OrderID=11; 

-- merge

insert into t2(data) 
values (N'что-то');

MERGE t1 AS target
USING (SELECT data from t2) AS source
    ON (target.data = source.data)
    WHEN MATCHED THEN 
        UPDATE SET data = source.data
	WHEN NOT MATCHED THEN	
	    INSERT (data)
	    VALUES (source.data);

select * from t1;


-- truncate
select * from t4;
truncate table t4;