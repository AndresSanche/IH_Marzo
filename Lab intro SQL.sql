USE sakila;
SELECT * FROM actor, film, customer;
SELECT title FROM film;
SELECT distinct language_id FROM actor, film, customer;
SELECT COUNT(store_id) FROM store;
SELECT COUNT(staff_id) FROM staff;
SELECT first_name FROM staff;
