#1-Write a query to display for each store its store ID, city, and country.
SELECT store_id, city, country
FROM store
JOIN address using(address_id)
JOIN city using(city_id)
JOIN country using(country_id)
GROUP BY store_id, city, country

#2-Write a query to display how much business, in dollars, each store brought in.
SELECT store_id, sum(amount)
FROM store
JOIN staff using(store_id)
JOIN payment using(staff_id)
GROUP BY store_id

#3-What is the average running time(length) of films by category?
SELECT `name`, avg(length)
FROM category 
JOIN film_category using(category_id)
JOIN film using(film_id)
GROUP BY `name`
ORDER BY `name`

#4-Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
SELECT `name`, avg(length)
FROM category 
JOIN film_category using(category_id)
JOIN film using(film_id)
GROUP BY `name`
ORDER BY avg(length) DESC
LIMIT 5;

#5-Display the top 5 most frequently(number of times) rented movies in descending order.
SELECT title
FROM film
JOIN inventory using(film_id)
JOIN rental using(inventory_id)
GROUP BY title
ORDER BY count(rental_id) DESC
LIMIT 5;

#6-List the top five genres in gross revenue in descending order.
SELECT `name`, sum(amount)
FROM category
JOIN film_category using(category_id)
JOIN film using(film_id)
JOIN inventory using(film_id)
JOIN rental using(inventory_id)
JOIN payment using(rental_id)
GROUP BY `name`
ORDER BY sum(amount) DESC
LIMIT 5;

#7-Is "Academy Dinosaur" available for rent from Store 1?
SELECT DISTINCT title, store_id
FROM film
JOIN inventory using(film_id)
JOIN store using(store_id)
where title = 'Academy Dinosaur' and store_id = 1;
GROUP BY title, store_id
