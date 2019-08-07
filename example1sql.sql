CREATE table restaurant(
	id serial primary key not null,
	name varchar,
	category varchar,
	address varchar
);

create table reviewer (
	id serial not null primary key,
	name varchar,
	email varchar,
	karma integer check (karma >=0 and karma<=7 )
);	

create table review (
	id serial not null primary key,
	reviewer_id integer references reviewer (id),
	stars integer check ( stars>=0 and stars<=5 ),
	title varchar,
	review varchar,
	restaurant_id integer references restaurant (id)
);

insert into restaurant values
(default, 'burger king', 'fast food', '171 butt way'),
(default, 'lovies', 'bbq', 'across the street'),
(default, 'chipotle', 'mexican', 'across the street'),
(default, 'cafe 100', 'sandwich', 'behind the parking lot'),
(default, 'chickFilA', 'chicken', 'half a mile');

select * from restaurant;

insert into reviewer values
(default, 'john', 'john@dc.com', 2),
(default, 'derek', 'derek@dc.com', 4),
(default, 'rick', 'rick@dc.com', 7),
(default, 'henry', 'henry@dc.com', 3);

insert into review values
(default, 1, 2, 'I ate here and it was ok', 'mediocre', 2),
(default, 1, 3, 'you might come here and like your food', 'acceptable', 5),
(default, 1, 1, 'I ate in hell', 'abyssmal', 1),
(default, 1, 2, 'I ate here and it was meh', 'mediocre', 3),
(default, 1, 4, 'I ate here and it was good', 'mediocre', 4),
(default, 2, 1, 'I ate here and it was ok', 'mediocre', 1),
(default, 3, 3, 'I ate here and it was ok', 'mediocre', 2),
(default, 4, 1, 'I ate here and it was ok', 'mediocre', 3),
(default, 4, 2, 'I ate here and it was ok', 'mediocre', 4),
(default, 4, 4, 'I ate here and it was ok', 'mediocre', 5);

select * from restaurant, review;
select * from restaurant, review where restaurant.id = review.restaurant_id and restaurant.id=5;
select * from restaurant, review where restaurant.id = review.restaurant_id and restaurant.name = 'chipotle';
select * from restaurant, review, reviewer where review.restaurant_id = restaurant.id and review.reviewer_id = reviewer.id and reviewer.name ='rick';

select restaurant.name, review.review from restaurant, review where review.restaurant_id = restaurant.id;

select restaurant.name, avg(review.stars) from restaurant, review
 where review.restaurant_id = restaurant.id
 group by restaurant.name
 order by avg(review.stars) desc;
 
 select restaurant.name, count(review.id) from restaurant, review
 where review.restaurant_id = restaurant.id
 group by restaurant.name
 order by count(review.id) desc;
 
 select restaurant.name, reviewer.name, review.review
  from restaurant, review, reviewer
 where review.restaurant_id = restaurant.id and
 	review.reviewer_id = reviewer.id ;
 
 select ru.name, floor(avg(r.stars))
 from reviewer ru, review r
 where r.reviewer_id = ru.id 
 group by ru.name
 order by avg(r.stars) desc
 limit 3;
 
 select ru.name, min(r.stars)
 from reviewer ru, review r
 where r.reviewer_id = ru.id
 group by ru.name
 order by min(r.stars) asc
 limit 4;
 
 select min(r.stars) from review r;
 
 select r.category, count(r.category)
 from restaurant r 
 group by r.category;

select r.name, count(r.category)
from restaurant r, review rv
where rv.restaurant_id = r.id and
rv.stars = 5
group by r.name;

select r.category, avg(rv.stars)
from restaurant r, review rv
where rv.restaurant_id = r.id
group by r.category;


