-- How many distinct (different) actors' last names are there?
select last_name 
from actor 
group by last_name 
having count(*) = 1;


-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * FROM rental;
SELECT rental_date, DATE_FORMAT((rental_date), '%M') AS 'month', WEEKDAY(rental_date) AS 'weekday',
CASE
WHEN WEEKDAY(rental_date) <='5' then 'workday'
WHEN WEEKDAY(rental_date) >'5' then 'weekend'
ELSE 'incorrect'
END AS 'day_type'
FROM sakila.rental;

-- Get all films with ARMAGEDDON in the title.

SELECT * from film
WHERE title like "%ARMAGEDDON%";


-- Get 10 the longest films.
SELECT title, length 
from film
GROUP BY title
ORDER by length DESC
limit 10;

-- How many films include Behind the Scenes content?

SELECT COUNT(film_id)
from film
where special_features LIKE '%Behind the Scenes%';



-- Which kind of movies (rating) have a mean duration of more than two hours?

select c.name, avg(F.length)
from category c
join film_category fc
using (category_id)
join film f
using(film_id)
where avg(length) > 120
group by c.name, avg(F.length)
order by avg(F.length) DESC;



-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.


SELECT title, length, RANK() OVER(ORDER BY length DESC) AS ranking
FROM sakila.film
WHERE length is not null OR length <> 0
ORDER BY ranking;


