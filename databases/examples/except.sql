
select name, age, weight from people
left join characters
using(name, age, weight)
where characters.name is null;

select name, age, weight from people
right join characters
using(name, age, weight)
where people.name is null;

select * from people;
select * from characters;