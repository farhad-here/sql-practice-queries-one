-- COUNTRIES AND PAYMENT
SELECT country.country AS country, SUM(pay.amount) AS total_pay
FROM payment AS pay
-- JOIN TABLES FROM CUSTOMER ADDRESS CITY COUNTRY
INNER JOIN customer ON pay.customer_id = customer.customer_id
INNER JOIN address addr ON customer.address_id = addr.address_id
INNER JOIN city c ON addr.city_id = c.city_id
JOIN country ON c.country_id = country.country_id
GROUP BY country.country
-- SORT
ORDER BY total_pay ASC
-- NUMBER OF COUNTRIES THAT HAVE A MOST PAYMENT
LIMIT 10;