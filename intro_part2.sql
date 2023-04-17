BETWEEN -- operator is used to match a value against a range of values; Inclusive
        -- amount<=9 AND amount>=8 same as amount BETWEEN 8 AND 9; 
NOT BETWEEN -- same X<Y OR X>Y; exclusive
            -- amount NOT BETWEEN 8 AND 9 same as amount>=9 OR amount<=8;
IN -- this operator allows me to check whether a value exists within a list of values or a SUBQUERY
NOT IN -- <> IN

-- using a subquery
SELECT *
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment WHERE customer_id BETWEEN 10 AND 15 )
-- NOT IN values 
SELECT amount FROM payment 
WHERE amount NOT IN (0.99,1.98,1.99)

LIKE -- operator allows us to perform pattern matching against string data with the use of wildcard characters
% -- matches any sequence of characterS
WHERE colum_name LIKE 'A%' -- match everything that begins with A

SELECT * FROM customer
WHERE first_name LIKE 'Ja%' AND last_name LIKE 'E%'

_ -- matches any single character, basically one underscore represents a char, __= charac, and etc.
ILIKE -- case INsensitive as oppossed to LIKE operator

SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 'e%'

SELECT COUNT(*) FROM film
WHERE rating='R' AND replacement_cost BETWEEN 5 AND 15