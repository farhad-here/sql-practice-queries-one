-- COLUMNS AND THE AVERAGE
SELECT c.name AS category_name, AVG(rental_duration) AS average_rental_duration
FROM film f
-- JOIN TABLES TO HAVE THE CATEGORY
INNER JOIN film_category ON film_category.film_id=f.film_id
INNER JOIN category c ON film_category.category_id=c.category_id
-- GROUP
GROUP BY c.name
-- SORT
ORDER BY average_rental_duration ASC;