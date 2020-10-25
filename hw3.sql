select 'Мазур Наталья Игоревна Т120-101М-20' as FIO;

select 
  userid, 
  movieid, 
  (rating - min(rating) over (partition by userid)) / (max(rating) over (partition by userid) - min(rating) over (partition by userid)) as normed_rating,
  avg(rating) over (partition by userId) 
from ratings 
limit 30;
