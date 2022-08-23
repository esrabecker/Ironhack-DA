#1-Which actor has appeared in the most films?
USE sakila;
select * from actor;
select * from film_actor;

SELECT first_name, last_name, count(film_id)
FROM actor 
JOIN film_actor  using(actor_id)
GROUP BY actor_id
ORDER BY count(film_id) DESC
LIMIT 1;

#2-Most active customer (the customer that has rented the most number of films)
select * from rental;
select * from customer;
SELECT first_name, last_name, count(rental_id)
FROM customer 
JOIN rental  using(customer_id)
GROUP BY customer_id
ORDER BY count(rental_id) DESC
LIMIT 1;

#3-List number of films per category
SELECT * FROM category;
SELECT * FROM film_category;
SELECT `name`, count(film_id)
FROM category
JOIN film_category using(category_id)
GROUP BY category_id
ORDER BY `name` 

#4-Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address
FROM staff
JOIN address using(address_id)
GROUP BY first_name, last_name, address
ORDER BY first_name DESC

#5-Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, SUM(amount) AS total
FROM staff 
JOIN payment
  ON staff.staff_id = payment.staff_id
     AND
     payment_date LIKE '2005-08%'
GROUP BY first_name, last_name;

#6-List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id)
FROM film
JOIN film_actor using(film_id)
GROUP BY title
ORDER BY count(actor_id) DESC
LIMIT 10;

#7-Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT first_name, last_name, sum(amount)
FROM customer
JOIN payment using(customer_id)
GROUP BY first_name, last_name
ORDER BY last_name
LIMIT 10;

#OPTIONAL:  Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM rental;

SELECT title
FROM film
JOIN inventory using(film_id)
JOIN rental using(inventory_id)
GROUP BY film_id
ORDER BY count(film_id) DESC
LIMIT 1;


