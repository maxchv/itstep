select * from (select name, age from characters
union
select people_name as 'name', age from people) 
as t 
order by age;