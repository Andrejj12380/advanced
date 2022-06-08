select title, year from albums a 
where year >= 2018;
select name, duration from tracks t 
where duration = (select max(duration) from tracks);
select name, duration from tracks t 
where duration >= 3.5;
select name, year from collections c 
where year between 2018 and 2020;
select name from singers s 
where (length(name) - length(replace(name, ' ', ''))) < 1;
select name from tracks t 
where name like '%Мой%' or name like '%my%' or name like '%мой%';