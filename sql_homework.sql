USE sakila;

select first_name, last_name from actor;

select first_name + " " + last_name as Actor_Name from actor;

select actor_id, first_name, last_name from actor where first_name = "JOE";

select first_name, last_name from actor where last_name LIKE '%GEN%';

select first_name, last_name from actor where last_name LIKE '%LI%' ORDER BY last_name;

select country_id, country from  country where country in ('Afghanistan', 'Bangladesh', 'China');

#alter table actor add description blob;

#alter table actor DROP COLUMN description;

select last_name, count(last_name) as total from actor group by last_name;

#select last_name, count(last_name) as total from actor group by last_name where count(last_name) >= 2;

select * from actor where first_name = 'GROUCHO' and last_name = 'WILLIAMS';
#update actor set first_name = "HARPO" where first_name = 'GROUCHO' and last_name = 'WILLIAMS';
select * from actor where first_name = 'HARPO';
#update actor set first_name = 'GROUCHO' where first_name = 'HARPO';

SHOW CREATE TABLE address;
/*
CREATE TABLE address ( 
address_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
address varchar(50) NOT NULL,
address2 varchar(50) DEFAULT NULL,
district varchar(50) DEFAULT NULL,
city_id smallint(5) unsigned NOT NULL,
postal_code varchar(10) DEFAULT NULL,
phone varchar(20) NOT NULL,
location geometry NOT NULL,
last_update timestamp NOT NULL DEFAULT
current_timestamp on update current_timestamp,
primary key (address_id),
KEY idx_fk_city_id(cityid)
);
*/

select staff.first_name, staff.last_name, address.address from staff INNER JOIN address on staff.address_id = address.address_id;


select staff.first_name, staff.last_name, sum(payment.amount) as payment_amount from staff INNER JOIN payment on staff.staff_id = payment.staff_id where payment.payment_date <= timestamp("2005-08-01") group by staff.staff_id;

select film.title, count(actor_id) as number_of_actor from film INNER JOIN film_actor on film.film_id = film_actor.film_id group by title;

select film.title, count(film.title) as film_count from film INNER JOIN Inventory on film.film_id = inventory.film_id where title = "Hunchback Impossible";

select customer.first_name, customer.last_name, sum(payment.amount) as total_amount_paid from customer join payment on customer.customer_id = payment.customer_id group by customer.customer_id;
