-- количество исполнителей в каждом жанре  ;
select genreid, count(*) from singersgenres s
group by genreid
order by genreid;

-- количество треков, вошедших в альбомы 2019-2020 годов;
select count(*) from tracks t 
join albums a on t.albumid = a.albumid
where year between 2019 and 2020;

-- средняя продолжительность треков по каждому альбому;
select title, avg(duration)  from tracks t 
join albums a on t.albumid = a.albumid
group by title;

-- все исполнители, которые не выпустили альбомы в 2020 году;
select singer_name from singers s  
join singersalbums s3 on s.singerid = s3.singerid
join albums a on s3.albumid = a.albumid
where year != 2020
group by singer_name;

-- названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select col_name from collections c 
join collectionstracks c2 on c.collectionid = c2.collectionid
join tracks t on c2.trackid = t.trackid
join singersalbums s on t.albumid = s.albumid
join singers s2 on s.singerid = s2.singerid
where s2.singerid = 4
group by col_name;

-- название альбомов, в которых присутствуют исполнители более 1 жанра;
select title from albums a
join singersalbums s on a.albumid = s.albumid
join singers s2 on s.singerid = s2.singerid
join singersgenres s3 on s2.singerid = s3.singerid
join genres g on s3.genreid = g.genreid
group by title
having count(*) > 1;

-- наименование треков, которые не входят в сборники;
select track_name from tracks t
left join collectionstracks c on t.trackid = c.trackid
where collectionid is null;

-- исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select singer_name from singers s
join singersalbums s2 on s.singerid = s2.singerid
join albums a on s2.albumid = a.albumid
join tracks t on t.albumid = a.albumid
where t.duration = (select min(duration) from tracks)
group by singer_name;


-- название альбомов, содержащих наименьшее количество треков.
select title, count(trackid) from albums a
left join tracks t on t.albumid = a.albumid
group by title
having count(*) = 1;