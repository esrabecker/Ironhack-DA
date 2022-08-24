#Lab | SQL Subqueries
USE sakila;
#1-How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT count(film_id) as f from inventory
WHERE film_id = (
SELECT film_id from film  
WHERE title = "Hunchback Impossible")
GROUP BY film_id

#2-List all films whose length is longer than the average of all the films.
select title, avg(length)
from film 
WHERE length > 
(SELECT avg(length) from film)
GROUP BY title

#3-Use subqueries to display all actors who appear in the film Alone Trip.
SELECT film_id from film
WHERE title = "Alone Trip"

SELECT actor_id from film_actor
WHERE film_id = (SELECT film_id from film
WHERE title = "Alone Trip")

SELECT first_name, last_name from actor
WHERE actor_id in (SELECT actor_id from film_actor
WHERE film_id = (SELECT film_id from film
WHERE title = "Alone Trip"))

#4-Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title 
FROM film
JOIN film_category using(film_id)
JOIN category using(category_id)
WHERE  category.name = "Family"

#5.Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name, last_name, email 
FROM customer
JOIN address using(address_id)
JOIN city using(city_id)
JOIN country using(country_id)
WHERE country.country = "Canada"