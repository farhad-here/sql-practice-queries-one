-- NAMES AND LASTNAMES WHO DID NOT RENT ANY KIND OF MOVIES IN THE END OF THE MONTH
SELECT  c.first_name || ' ' || c.last_name AS no_rental_last_month_full_name
FROM customer c
-- CONDITION
WHERE c.customer_id NOT IN (
	SELECT r.customer_id
	FROM rental r
	-- DID NOT RENT MOVIES IN THE END OF THE MONTH
	WHERE DATE_TRUNC('month',r.rental_date)=(
		SELECT DATE_TRUNC('month',MAX(rental_date)) FROM rental
	)

);