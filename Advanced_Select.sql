-- ���������� ������������ � ������ �����;
select genreid, count(*) from singersgenres s
group by genreid
order by genreid;

-- ���������� ������, �������� � ������� 2019-2020 �����;
select count(*) from tracks t 
join albums a on t.albumid = a.albumid
where year between 2019 and 2020;

-- ������� ����������������� ������ �� ������� �������;
select title, avg(duration)  from tracks t 
join albums a on t.albumid = a.albumid
group by title;

-- ��� �����������, ������� �� ��������� ������� � 2020 ����;
select singer_name from singers s  
join singersalbums s3 on s.singerid = s3.singerid
join albums a on s3.albumid = a.albumid
where year != 2020
group by singer_name;

-- �������� ���������, � ������� ������������ ���������� ����������� (�������� ����);
select col_name from collections c 
join collectionstracks c2 on c.collectionid = c2.collectionid
join tracks t on c2.trackid = t.trackid
join singersalbums s on t.albumid = s.albumid
join singers s2 on s.singerid = s2.singerid
where s2.singerid = 4
group by col_name;

-- �������� ��������, � ������� ������������ ����������� ����� 1 �����;
select title from albums a
join singersalbums s on a.albumid = s.albumid
join singers s2 on s.singerid = s2.singerid
join singersgenres s3 on s2.singerid = s3.singerid
join genres g on s3.genreid = g.genreid
group by title
having count(*) > 1;

-- ������������ ������, ������� �� ������ � ��������;
select track_name from tracks t
left join collectionstracks c on t.trackid = c.trackid
where collectionid is null;

-- �����������(-��), ����������� ����� �������� �� ����������������� ���� (������������ ����� ������ ����� ���� ���������);
select singer_name from singers s
join singersalbums s2 on s.singerid = s2.singerid
join albums a on s2.albumid = a.albumid
join tracks t on t.albumid = a.albumid
where t.duration = (select min(duration) from tracks)
group by singer_name;


-- �������� ��������, ���������� ���������� ���������� ������.
select title, count(trackid) from albums a
left join tracks t on t.albumid = a.albumid
group by title
having count(*) = 1;