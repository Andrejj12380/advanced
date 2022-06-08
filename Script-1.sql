create table if not exists Collection (
	id SERIAL primary key,
	Name VARCHAR(60) not null
);
create table if not exists Album (
	id SERIAL primary key,
	Title VARCHAR(60) not null,
	Year INTEGER not null,
	singer_id INTEGER NOT NULL REFERENCES Singer(id),
	genre_id INTEGER NOT NULL REFERENCES Genre(id)
);
create table if not exists Singer (
	id SERIAL primary key,
	Name VARCHAR(60) not null,
	album_id INTEGER NOT NULL REFERENCES Album(id)
);
create table if not exists Genre (
	id SERIAL primary key,
	Name VARCHAR(60) not null,
	singer_id INTEGER NOT NULL REFERENCES Singer(id)
);
create table if not exists Track (
	id SERIAL primary key,
	Name VARCHAR(60) not null,
	Duration INTEGER not null,
	album_id INTEGER NOT NULL REFERENCES Album(id),
	collection_id INTEGER NOT NULL REFERENCES Collection(id)
);