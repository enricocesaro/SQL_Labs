-- Select all the actors with the first name ‘Scarlett’.  2
USE sakila;
SELECT actor_id, first_name, last_name from actor 
WHERE first_name = "Scarlett";

-- How many films (movies) are available for rent and how many films have been rented?  1000, 
-- join
SELECT COUNT(DISTINCT film_id) from film;
SELECT COUNT(DISTINCT rental_date) from rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration
-- min RIDGEMONT SUBMARINE, max
SELECT title, MAX(length) as max_duration, MIN(length) as min_duration
from film
group by title
order by max_duration DESC;

SELECT title, MAX(length) as max_duration, MIN(length) as min_duration
from film
group by title
order by min_duration ASC;


-- What's the average movie duration expressed in format (hours, minutes)?

SELECT title, AVG(length) as 'Average Duration' 
from film;



-- How many distinct (different) actors' last names are there?
select distinct last_name
from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(DAY, return_date - rental_date) as days
from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format((rental_date), '%M') as 'rental_month', date_format((rental_date), '%W') as 'rental_week',
CASE
WHEN 'rental_week' = "Saturday" then "weekend"
WHEN 'rental_week' = "Sunday" then "weekend"
ELSE 'workday'
End as "day_type"
FROM rental
LIMIT 20;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.



-- Get release years
SELECT DISTINCT release_year from film;

-- Get all films with ARMAGEDDON in the title

SELECT * from film
WHERE title like "%ARMAGEDDON%";


-- Get all films which title ends with APOLLO.
SELECT title from film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films
SELECT title, length 
from film
GROUP BY title
ORDER by length DESC
limit 10;

-- How many films include Behind the Scenes content?











