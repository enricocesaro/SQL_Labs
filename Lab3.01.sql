#1 Drop column picture from staff
use sakila;
ALTER TABLE staff DROP picture;

select * from staff;


#2 A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT *
FROM sakila.staff
WHERE first_name = 'Jon';

SELECT *
FROM sakila.customer
WHERE first_name = 'TAMMY' and last_name = 'SANDERS';

INSERT INTO sakila.staff(first_name, last_name, address_id, email, store_id,active,username)
VALUES
('TAMMY','SANDERS','79','TAMMY.SANDERS@sakilacustomer.org',2,1,'TAMMY');


#3



#Activity 2 --bonus -- upload pic of paper drawing 