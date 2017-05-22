use people;

DELIMITER $
CREATE PROCEDURE create_person(in fname VARCHAR(255),
                               in lname VARCHAR(255),
                               in mail VARCHAR(255),
                               in vcity VARCHAR(255),
                               out id int)
  BEGIN
    DECLARE c_id int; -- локальная переменная
    SELECT city_id into c_id  from city WHERE name = vcity;
    IF c_id IS NULL
    THEN
      INSERT INTO city(name) VALUES (vcity);
      SELECT city_id into c_id  from city WHERE name = vcity;
    END IF;
    INSERT person(first_name, last_name, email, city_id) VALUES (fname, lname, mail, c_id);
    SELECT person_id INTO id FROM person WHERE first_name=fname
                                               and last_name=lname
                                               and email=mail
                                               and person.city_id=c_id;
  END $
DELIMITER ;

select * from person;
select * from city;

set @id = 0; -- системная переменная
call create_person("roma", "romanov", "mail@mail.com", "Dnipro", @id);
select @id;
call create_person("sam", "romanov", "mail@mail.uk", "London", @id);
select @id;

DELIMITER $$
CREATE FUNCTION dummy(invar int)
  RETURNS int
  BEGIN
    RETURN invar*10;
  END $$
DELIMITER ;

select dummy(20);
select first_name, last_name, city_id, dummy(city_id) from person;