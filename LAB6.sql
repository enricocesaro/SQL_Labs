USE sakila;

-- 1st

select last_name 
from actor group 
by last_name 
having count(*) = 1;

-- 2nd
select last_name 
from actor 
group by last_name 
having count(*) > 1;

-- 3rd
SELECT rental_id, staff_id 
from rental;

-- 4th
SELECT release_year, count(*)
	FROM film
	GROUP BY release_year;
    
-- 5th
SELECT rating, COUNT(film_id) AS 'number_of_films' FROM film 
GROUP BY rating;

-- 6th

SELECT rating, Round(AVG(length), 2) as 'average_length' FROM film
GROUP BY rating;

-- 7th
SELECT rating , Round(AVG(length), 0) as 'average_length' FROM film
WHERE 'average_length' > 160
GROUP BY rating;

-- 8th ??
SELECT title, length, rating, from film
where title is not null
group by length; 



