select 'Мазур Наталья Игоревна Т12О-101М-20';

create table content_genres
(
    movieId int,
    genre   text
);

copy content_genres from '/usr/share/data_store/raw_data/genres.csv' delimiter ',' csv header;

select count(1) from content_genres;

WITH top_rated as (
    select movieid, avg(rating) avg_rating
    from ratings
    group by movieid
    having count(1) >= 50
    order by avg_rating desc, movieid
    limit 150)
SELECT tr.movieId, kw.top_rated_tags
INTO top_rated_tags
FROM top_rated tr
         join (select cg.movieid,
                      array_agg(cg.genre) top_rated_tags
               from content_genres cg
               group by movieid) kw
              on tr.movieid = kw.movieid;

\copy top_rated_tags TO '/usr/share/data_store/raw_data/top_rated_movies_with_keywords.csv' delimiter ',' csv header;
