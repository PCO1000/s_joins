--Joins Assignment

--1. List all customers who live in Texas (use Joins).
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';
--Answer = Jennifer, Kim, Richard, Bryan and Ian.

--2. Get all payments above $6.99 with the Customer's FullName
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
ORDER BY amount DESC;
--3. Show all customers names who have made payments over $175(usesubqueries)

SELECT first_name, last_name, email, customer_id
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);
--4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Answer = Kevin Schuler

--5. Which staff member had the most transactions?
SELECT first_name, last_name, payment.staff_id, COUNT(payment.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY payment.staff_id, first_name, last_name;

--Answer = 'Jon Stephens'


--6. How many movies of each rating are there?
SELECT rating, COUNT(rating) AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC;

--7 Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, customer_id
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
);
--8 How many free rentals did our store give away?
SELECT *
FROM film
WHERE rental_rate = 0.00;

--Ans none. No information about free rentals was provided. 