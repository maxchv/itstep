drop database if exists test;
create database test;
use test;

-- таблица, за которой мы будем следить
CREATE TABLE test 
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL 
);

-- лог
CREATE TABLE log 
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    msg VARCHAR( 255 ) NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    row_id INT NOT NULL,
    content TEXT NOT NULL 
);

-- триггер
DELIMITER |

CREATE TRIGGER insert_test AFTER INSERT ON test
FOR EACH ROW BEGIN
   INSERT INTO log Set msg='insert', row_id = NEW.id, content = NEW.content;
END|

CREATE TRIGGER update_test before update ON test
FOR EACH ROW BEGIN
  INSERT INTO log Set msg='update', row_id = OLD.id, content = OLD.content;
END|

CREATE TRIGGER delete_test before delete ON test
FOR EACH ROW BEGIN
  INSERT INTO log Set msg='delete', row_id = OLD.id, content = OLD.content;
END|

DELIMITER ;

insert into test(content) values('It content was added');
update test set content='new updated content' where id=1;
delete from test where id=1;
select * from test;
select * from log;