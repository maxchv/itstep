-- intersect

select distinct 
 name, age, weight
 from people
 join characters
 using (name, age, weight);