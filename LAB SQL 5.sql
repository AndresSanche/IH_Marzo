use Sakila;
show tables;

#Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor
WHERE first_name = 'Scarlett';

#How many films (movies) are available for rent and how many films have been rented?
show tables;
SELECT * FROM inventory;

#What are the shortest and longest movie duration? Name the values max_duration and min_duration.
show tables;
SELECT MIN(length) AS "MIN MOVIE",MAX(length) AS "MAX MOVIE" FROM film;

#What's the average movie duration expressed in format (hours, minutes)?
#SELECT length FROM film
#SELECT time_format(convert(AVG(length),minutes),"%H %i %s") FROM film
#SELECT AVG(length) FROM film
#SELECT time_format(AVG(length), '%H:%I') FROM film
SELECT Floor(AVG(length)/60) as Horas, ceiling(AVG(length) % 60) AS Minutos FROM film;

#How many distinct (different) actors' last names are there?
SELECT COUNT(distinct last_name) FROM actor;

#Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date)) AS 'Dias operando' from rental;

#Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, MONTH(rental_date) AS month, DAYOFWEEK(rental_date) AS day FROM rental
order by month DESC
LIMIT 20;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, MONTH(rental_date) AS month, DAYNAME(rental_date) AS day, 
CASE
WHEN DAYOFWEEK(rental_date) IN (6,7) THEN 'WEEKEND'
ELSE 'WEEKDAY'
END AS day_type
FROM rental
LIMIT 20;

#How many rentals were in the last month of activity?
SELECT max(rental_date) FROM rental;

SELECT COUNT(rental_date) 
FROM rental 
WHERE rental_date >= '2006-02-01 00:00:00'; 
