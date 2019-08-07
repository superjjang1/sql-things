Create Table Artist (
id serial primary key not null,
name varchar,
song_num integer,
album_num integer );

Create Table Album (
id serial primary key not null,
name varchar,
artist varchar,
tracks integer,
year integer);

create table track (
id serial primary key not null,
song_name varchar,
album varchar,
songwriter varchar);

create table song (
id serial primary key not null,
song_name varchar,
album varchar,
songwriter varchar,
duration integer,
artist varchar);

create table songwriter (
name varchar,
song varchar,
album varchar,
year integer);



