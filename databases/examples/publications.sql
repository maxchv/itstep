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
    

