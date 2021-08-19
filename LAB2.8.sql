-- Write a query to display for each store its store ID, city, and country.
SELECT s.store_id, c.city, co.country
from store s
join address a
on s.address_id = a.address_id
join city c
on a.city_id = c.city_id
join country co
on c.country_id = co.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
Select s.store_id, CONCAT(sum(p.amount), ' $')
from payment p
join staff s
on p.staff_id = s.staff_id
group by s.store_id;


-- Which film categories are longest?
select c.name, AVG(f.length)
from film f
join film_category fc
on f.film_id = fc.film_id
join category c
on fc.category_id = c.category_id
group by c.name
order by AVG(f.length) DESC;


-- Display the most frequently rented movies in descending order.
SELECT f.title
from film f
join inventory i
using (film_id)
join rental r
using (inventory_id)
group by f.title
order by count(rental_id) DESC;


-- List the top five genres in gross revenue in descending order.
SELECT c.name, sum(p.amount)
from category c
join film_category fc
USING (category_id)
join film f
USING (film_id)
join inventory i
USING (film_id)
join rental r
USING (inventory_id)
join payment p
USING (customer_id)
group by c.name
order by sum(p.amount) DESC
limit 5;


-- Is "Academy Dinosaur" available for rent from Store 1?
SELECT *
FROM film f 
INNER JOIN inventory i 
ON i.film_id = f.film_id
WHERE i.store_id = 1 AND f.title = "Academy Dinosaur";


-- Get all pairs of actors that worked together.  ??? Ask ?? SELFJOIN ONLY OR ACTUAL JOIN, how to get the pair?





-- Get all pairs of customers that have rented the same film more than 3 times.
SELECT f.title, a.first_name, a.last_name



-- For each film, list actor that has acted in more films.

SELECT f.title, a.first_name, a.last_name
FROM film f
JOIN film_actor fa
using(film_id)
WHERE 

FROM  GROUP BY act_id 
HAVING COUNT(act_id)>1)));