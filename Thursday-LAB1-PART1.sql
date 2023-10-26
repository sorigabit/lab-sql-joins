USE sakila;


#How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT film_category.category_id, COUNT(film_category.film_id) AS Number_of_films
FROM sakila.film_category
JOIN sakila.film
ON sakila.film_category.film_id = sakila.film.film_id
GROUP BY film_category.category_id;

#Display the total amount rung up by each staff member in August of 2005.

SELECT staff.first_name, SUM( payment.amount)
FROM sakila.payment
JOIN sakila.staff
ON sakila.payment.staff_id = sakila.staff.staff_id
WHERE payment_date LIKE "2005-08%"
GROUP BY staff.staff_id;

#Which actor has appeared in the most films?

SELECT actor.last_name, actor.first_name, COUNT(film_actor.film_id) as No_films
FROM sakila.actor
JOIN sakila.film_actor
ON sakila.actor.actor_id = sakila.film_actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY No_films DESC;

#Most active customer (the customer that has rented the most number of films)
SELECT customer.first_name, customer.last_name,COUNT(rental.customer_id) as No_of_rentals
FROM sakila.rental
JOIN sakila.customer
USING (customer_id)
GROUP BY customer_id
ORDER BY No_of_rentals DESC;

#Display the first and last names, as well as the address, of each staff member.

SELECT sakila.staff.first_name, sakila.staff.last_name, sakila.address.address
FROM sakila.staff
JOIN sakila.address
USING (address_id);

#List each film and the number of actors who are listed for that film.

SELECT sakila.film.title, COUNT(film_actor.actor_id) as No_of_actors
FROM sakila.film
JOIN sakila.film_actor
USING (film_id)
GROUP BY film_id
ORDER BY No_of_actors DESC;

#Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

SELECT SUM(payment.amount) as Total_amount, customer.last_name as Customer
FROM sakila.payment
JOIN sakila.customer
USING (customer_id)
GROUP BY payment.customer_id;

#List the titles of films per category.

SELECT category.name, GROUP_CONCAT(film.title) AS Movie_title
FROM sakila.category
JOIN sakila.film_category
USING (category_id)
JOIN film
ON film.film_id = film_category.film_id
GROUP BY category.name;












