select title, year from albums a 
where year >= 2018;

select track_name, duration from tracks t 
where duration = (select max(duration) from tracks);

select track_name, duration from tracks t 
where duration >= 3.5;

select col_name, year from collections c 
where year between 2018 and 2020;

select singer_name from singers s 
where (length(singer_name) - length(replace(singer_name, ' ', ''))) < 1;
select track_name from tracks t 
where track_name like '%Мой%' or track_name like '%my%' or track_name like '%мой%';

select max(year), min(col_name) from collections c ;
select avg(duration) from tracks;
select count(distinct duration) from tracks;
select count(*) from tracks;
select sum(duration) from tracks
where duration = 5;

-- Вложенные запросы
select track_name, duration from tracks t 
where duration >= avg(duration); -- не сработает, потому что вычисление происходит после фильтрации

select track_name, duration from tracks t
where duration >= (select avg(duration) from tracks);

select track_name, albumid from tracks t 
where albumid < (select max(duration) from tracks)
order by track_name desc;

select duration, count(*) from tracks t  -- в селекте обязательно должны присутствовать столбики, которые находятся в группбай, иначе - ошибка
group by duration
order by count(*); 

select duration, count(*) from tracks t  -- 
group by duration
having count(*) > 4
order by duration desc;

select track_name, duration, year from tracks t 
left join albums a on t.albumid = a.albumid
order by year;