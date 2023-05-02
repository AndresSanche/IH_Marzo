USE sakila;

	
SELECT title, length
FROM film
WHERE length IS NOT NULL AND length != 0
ORDER BY length DESC;

SELECT f.title, f.length, f.rating
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE f.length IS NOT NULL AND f.length != 0
ORDER BY c.name, f.length DESC;

SELECT c.name, COUNT(*) as num_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

SELECT a.first_name, a.last_name, COUNT(*) as num_films
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY num_films DESC
LIMIT 5;

SELECT c.first_name, c.last_name, COUNT(*) as num_rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_rentals DESC
LIMIT 1;