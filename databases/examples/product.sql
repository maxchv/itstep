select name_cartoon, name_channel from cartoons, channels
   where channel_id = id_channel;
   
select * from 
cartoons
cross join
channels
cross join
cartoonschannels;


