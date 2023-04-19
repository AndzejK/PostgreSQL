-- Timestamps and Extract 
EXTRACT() == DATEPART() in MS SQL Server

SELECT TO_CHAR(payment_date,'DD-Mon-YYYY, HH:MI') FROM payment -- "14-Feb-2007, 09:21"
--  this string 'DD-Mon-YYYY, HH:MI' I can modify as much as I like, each letter represents the actual month's name

-- I count transactions for a specific period of time for each Monday, or week of the day
SELECT COUNT(payment_id),TO_CHAR(payment_date,'Day') as DAY FROM payment
GROUP BY TO_CHAR(payment_date,'Day') 

-- But what if I want to know how many transactions each Monday are going through?
SELECT COUNT(payment_id), TO_CHAR(payment_date_trunc, 'Day') AS day_of_week, payment_week
FROM (
    SELECT payment_id, payment_date, DATE_TRUNC('week', payment_date) AS payment_date_trunc, 
	TO_CHAR(DATE_TRUNC('week', payment_date), 'YYYY-MM-DD') AS payment_week
    FROM payment
) AS payment_weeks
GROUP BY payment_week, day_of_week
ORDER BY payment_week, day_of_week;

-- same query but simplified

SELECT COUNT(*), 
       TO_CHAR(payment_date, 'Day') AS day_of_week, 
       DATE_TRUNC('week', payment_date) AS payment_week
FROM payment
WHERE EXTRACT (dow FROM payment_date)=1 -- getting all Mondays 
GROUP BY payment_week, day_of_week
ORDER BY payment_week, day_of_week;


-- using DOW can help do the same job what I did in the above querry
SELECT COUNT(payment_id) FROM payment
WHERE EXTRACT (dow FROM payment_date)=1   -- 0 Sun - 6 Sat
                                      
