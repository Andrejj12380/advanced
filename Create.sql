create table if not exists genres (
	genreid serial primary key,
	name varchar(60) unique not null
);
create table if not exists singers (
	singerid serial primary key,
	name varchar(60) not null
);
create table if not exists singersgenres (
	singerid integer references singers(singerid),
	genreid integer references genres(genreid),
	constraint pk primary key (singerid, genreid)
);
create table if not exists albums (
	albumid serial primary key,
	title varchar(60) not null,
	year integer not null
);
create table if not exists singersalbums (
	singerid integer references singers(singerid),
	albumid integer references albums(albumid),
	constraint albumpk primary key (singerid, albumid)
);
create table if not exists tracks (
	trackid serial primary key,
	name varchar(60) unique not null,
	duration integer not null,
	albumid integer not null references albums(albumid)
);
create table if not exists collections (
	collectionid serial primary key,
	name varchar(60) not null,
	year integer not null
);
create table if not exists collectionstracks (
	trackid integer references tracks(trackid),
	collectionid integer references collections(collectionid),
	constraint collectionpk primary key (trackid, collectionid)
);