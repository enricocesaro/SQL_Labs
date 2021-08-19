-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
USE sakila;

SELECT c.name, count(d.film_id)
FROM sakila.category c
JOIN sakila.film_category d
USING(category_id)
GROUP BY c.name
ORDER BY count(d.film_id) desc;

SELECT RENTAL_DATE FROM RENTAL;

-- Display the total amount rung up by each staff member in August of 2005.
USE sakila;

SELECT rental_date, first_name, last_name, count(rental_id) as 'Total_Rung'
from staff
join rental
using (staff_id)
where rental_date LIKE "%2005-08%"
group by first_name, last_name;

-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, count(f.film_id)
from sakila.actor a
join sakila.film_actor f
on a.actor_id = f.actor_id
group by a.first_name, a.last_name
order by count(f.film_id) DESC;

-- Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(i.film_id)
from sakila.customer c
join sakila.rental r
on r.customer_id = c.customer_id
join inventory i
on i.inventory_id = r.inventory_id
group by c.first_name, c.last_name
order by count(i.film_id) DESC;

-- Display the first and last names, as well as the address, of each staff member.
select s.first_name, s. last_name, a.address, a.address2
from sakila.staff s
join sakila.store st
on s.store_id = st.store_id
join sakila.address a
on st.address_id = a.address_id;


-- List each film and the number of actors who are listed for that film.
SELECT f.title, count(a.actor_id)
from sakila.film_actor a
join sakila.film f
on a.film_id = f.film_id
group by f.title;


-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT c.first_name, c.last_name, sum(p.amount)
from sakila.payment p 
join sakila.customer c
on c.customer_id = p.customer_id
group by c.first_name, c.last_name
order by c.last_name ASC;


-- List number of films per category.

select c.name, count(f.film_id)
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name;

