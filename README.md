# DVD Rental SQL Queries

This repository contains a collection of SQL queries written using PostgreSQL on the classic **DVD Rental** sample database. The queries are designed to answer analytical questions commonly used in data analysis tasks.

## 🗃️ Dataset

The queries are based on the standard [DVD Rental sample database](https://www.postgresqltutorial.com/postgresql-sample-database/), which includes tables such as `customer`, `rental`, `payment`, `film`, `category`, and more.

## 📌 SQL Tasks

### 1. Calculate the average rental duration for each genre (category)

```sql
SELECT c.name AS category,
       ROUND(AVG(f.rental_duration), 2) AS avg_rental_duration
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_rental_duration DESC;
```
2. Find the full names of customers who did not rent any movies in the most recent mont
```sql
SELECT c.first_name || ' ' || c.last_name AS full_name
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
WHERE c.customer_id NOT IN (
    SELECT customer_id
    FROM rental
    WHERE DATE_TRUNC('month', rental_date) = (
        SELECT DATE_TRUNC('month', MAX(rental_date)) FROM rental
    )
);
```
3. Find the top 10 countries by total rental payment
```sql
SELECT co.country, 
       ROUND(SUM(p.amount), 2) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country
ORDER BY total_payment DESC
LIMIT 10;
```
