drop database if exists Cartoons;

create database Cartoons default character set 'utf8' collate utf8_general_ci;

use Cartoons;

create table Cartoons
(
    id_cartoon      int auto_increment primary key,
    name_cartoon    text not null
) character set=utf8;

insert into Cartoons(name_cartoon)
    values('The Simpsons'),
          ('Family Guy'),
          ('Duck Tales');

create table Channels
(
    id_channel      int auto_increment primary key,
    name_channel    text not null
) character set=utf8;

insert into Channels(name_channel)
    values('1+1'),
          ('СТБ'),
          ('Интер'),
          ('2+2'),
          ('1+1'),
          ('BBC');

create table CartoonsChannels
(
    id_cartoon      int not null,
    name_cartoon    text not null,
    name_channel    text not null
) character set=utf8;

insert into CartoonsChannels
    values(0, 'The Simpsons', 'Inter'),
          (0, 'The Simpsons', '1+1'),
          (0, 'The Simpsons', 'СТБ'),
          (1, 'Family Guy', 'Inter'),
          (1, 'Family Guy', '1+1'),          
          (2, 'Duck Tales', 'СТБ'),
          (2, 'Duck Tales', '1+1');

drop table if exists Channels;
create table Channels
(
    name_channel    text not null
) character set=utf8;

insert into Channels(name_channel)
    values('Inter'), ('1+1');

drop table if exists Channels;

create table Channels
(
    id_channel int auto_increment primary key,
    name_channel tinytext not null
);

insert into Channels (name_channel)
    values('Inter'), 
          ('ICTV'), 
          ('2+2'),
          ('1+1'),
          ('BBC');

drop table if exists Cartoons;

create table Cartoons
(   
    id_catroons int auto_increment primary key,
    name_cartoon text not null,
    channel_id int,
    foreign key(channel_id) references Channels(id_channel)
);

insert into Cartoons(name_cartoon, channel_id)
    values('The Simpsons', 1),
          ('Family Guy', 1),
          ('Duck Tales', 2);

alter table Cartoons drop foreign key cartoons_ibfk_1;
insert into Cartoons(name_cartoon, channel_id)
	values('Futurama', 10),
          ('Spanch Bob', 15);

select * from Cartoons 
	cross join Channels;

select * from Cartoons
	 inner join Channels
     on Cartoons.channel_id = Channels.id_channel;
    
    
select * from Cartoons
	left outer join Channels
    on Cartoons.channel_id = Channels.id_channel;
    
select * from Cartoons
	right outer join Channels
    on Cartoons.channel_id = Channels.id_channel;
    

select * from Cartoons
	left outer join Channels
    on Cartoons.channel_id = Channels.id_channel
union
select * from Cartoons
	right outer join Channels
    on Cartoons.channel_id = Channels.id_channel;






