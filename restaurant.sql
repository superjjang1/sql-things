create database restaurant;

Create TABLE restaurant (
name varchar,
distance integer,
stars integer,
category varchar,
favorite_dish varchar,
does_takeout boolean,
time_you_ate date 
);

insert into restaurant values (
'Lovies', 1, 1, 'bbq', 'chicken salad', true, '08/01/2019'
);

insert into restaurant values (
'Naan Stop', 1, 2, 'indian food', 'vegan delight', true, '08/04/2019'
);

insert into restaurant values ( 
'Chipotle', 1, 0, 'nothing', 'nothing', true, '01/01/2000'
);

ALTER TABLE restaurant
rename COLUMN distance to distance_miles;

select * from restaurant;

select * from restaurant where stars > 1;

select favorite_dish from restaurant where stars > 1;

select id from restaurant where name 'lovies';

select id from restaurant where name = 'lovies';

ALTER TABLE restaurant
ADD id serial primary key;

select id from restaurant where name = 'Lovies';

select name from restaurant where category = 'bbq';

select name from restaurant where does_takeout = true;

select name from restaurant where does_takeout = true and category = 'bbq';

select name from restaurant where distance_miles < 5;

select name from restaurant where time_you_ate between '08/01/2019' and '08/06/2019';