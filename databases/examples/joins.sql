select name_cartoon, name_channel from 
 cartoons
 inner join
 channels
 on channel_id = id_channel;
 
select * from 
 cartoons
 left outer join
 channels
 on channel_id = id_channel;
 
 
select * from 
 cartoons
 right outer join
 channels
 on channel_id = id_channel;
 
select * from 
 cartoons
 left outer join
 channels
 on channel_id = id_channel
union 
select * from 
 cartoons
 right outer join
 channels
 on channel_id = id_channel;