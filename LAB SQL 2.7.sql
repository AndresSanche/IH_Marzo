use sakila;
show tables;
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

LOAD DATA LOCAL INFILE 'C:\\Users\\sanch\\OneDrive\\Documents\\IronHack\\Semana 3\\films_2020.txt'
INTO table films_2020
fields terminated BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating);

SELECT * FROM films_2020;

UPDATE films_2020
SET rental_duration = 3, rental_rate=2.99, replacement_cost=8.99;

show variables like 'local_infile';
set global local_infile = 1;

#PArte 2
#1 In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, 
#  you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
#  So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
#  hence we would want this in our output list.

SELECT * FROM actor;
SELECT last_name FROM actor
group by last_name
having count(last_name) = 1;

#2 Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last 
#  names of the actors where the last name was present more than once
SELECT * FROM actor;
SELECT last_name FROM actor
group by last_name
having count(last_name) > 1;

#3 Using the rental table, find out how many rentals were processed by each employee.
select * FROM rental;
SELECT staff_id, COUNT(*) FROM rental
group by staff_id;

#4 Using the film table, find out how many films were released.
SELECT * FROM film;
SELECT COUNT(title) as num_films FROM film;

#5 Using the film table, find out how many films there are of each rating.
SELECT rating, COUNT(*) as num_films FROM film
group by rating
order by num_films DESC;

#6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rating, round(avg(length),2) FROM film
GROUP BY rating;

#7 Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(avg(length),2) as avg_l FROM film
GROUP BY rating
HAVING avg_l > 120