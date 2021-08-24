#1

SELECT title, COUNT(inventory_id)
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";


#2
SELECT title FROM film
WHERE length > (SELECT avg(length)
                FROM film)
ORDER BY length desc;

#3
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
Select actor_id
FROM film_actor
WHERE film_id IN 
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));


#4
SELECT f.title, ca.name
FROM film f
join film_category fc
using(film_id)
join category ca
using (category_id)
WHERE ca.name = 'Family';


#5 Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

#join
SELECT c.first_name, c.last_name, c.email
from customer c
join address a
using (address_id)
join city ci
using (city_id)
join country co
using(country_id)
where country = 'Canada';

#Subqueries
SELECT first_name, last_name, email
FROM customer
WHERE address_id IN
(
Select address_id
FROM address
WHERE city_id IN 
(
SELECT city_id
FROM city
WHERE country_id IN
(
SELECT country_id
FROM country
WHERE country = "Canada"
)));


#6
#most prolific

SELECT f.title 
FROM sakila.film f
WHERE film_id IN(
SELECT film_id FROM film_actor
WHERE actor_id = (SELECT actor_id FROM ( 
SELECT actor_id, COUNT(film_id) FROM sakila.film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1)sub1) 




#7
#Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
SELECT f.title 
FROM sakila.film f
WHERE film_id IN(
SELECT film_id FROM inventory
WHERE inventory_id in
(
select inventory_id
from rental
where customer_id in
(
select customer_id from
customer 
where customer_id in
(
select customer_id from
payment
WHERE customer_id = (SELECT actor_id FROM ( 
SELECT actor_id, sum(amount) FROM payment
GROUP BY 
ORDER BY sum(amount) DESC
LIMIT 1)sub1) 




#8 Customers who spent more than the average payments.

SELECT first_name, last_name
FROM customer
WHERE customer_id IN
(
Select customer_id
FROM payment
WHERE amount > (SELECT avg(amount)
                FROM payment)
ORDER BY amount desc
);








-- select transactions where the k_symbol is from the 'larger' k_symbols
  SELECT * FROM bank.trans
  WHERE k_symbol IN (
    SELECT k_symbol AS symbol FROM (
      SELECT avg(amount) AS Average, k_symbol
      FROM bank.order
      WHERE k_symbol <> ' '
      GROUP by k_symbol
      HAVING Average > 3000    #its a chosen parameter
      ORDER BY Average DESC



