create table student2 (
	id SERIAL not null primary key,
	name varchar not null,
	graduated boolean default FALSE,
	start_date date,
	github varchar,
);

insert into student2 VALUES (
default, 'Sean Yim', FALSE, '08/06/2019', 'superjjang1'
);

select * from student2;
