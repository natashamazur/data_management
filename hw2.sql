select 'Мазур Наталья Игоревна Т120-101М-20';

--выбрать 10 записей из таблицы ratings
select * from movie.ratings limit 10;

--выбрать из таблицы links всё записи, у которых imdbid оканчивается на "42", а поле movieid между 100 и 1000
select * from links where imdbid like '%42' and movieid between 100 and 1000;

--выбрать из таблицы links все imdbId, которым ставили рейтинг 5
select distinct imdbid from links ln inner join ratings rt on ln.movieid=rt.movieid;

--Посчитать число фильмов без оценок
select count(1) from links ln left join ratings rt on ln.movieid=rt.movieid where rating is null group by rt.movieid;

--вывести top-10 пользователей, у который средний рейтинг выше 3.5
select userid, avg(rating) avg_rating from ratings group by userid having avg(rating)>3.5 order by userid limit 10;

--достать любые 10 imbdId из links у которых средний рейтинг больше 3.5.
select imdbid from links where movieid in (select movieid from ratings group by movieid having avg(rating)>3.5 limit 10);

--посчитать средний рейтинг по пользователям, у которых более 10 оценок. Нужно подсчитать средний рейтинг по все пользователям, которые попали под условие - то есть в ответе должно быть одно число.
with active_users as (
select userid from ratings group by userid having count(1)>10
)
select avg(rating) from ratings where userid in (select * from active_users);
