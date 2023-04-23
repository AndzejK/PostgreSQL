/* CASE statement is used when only a certain condition is met (like IF/ELSE) */

-- General Syntax
CASE -- No expression 
    WHEN condition_1 THEN result_1
    WHEN condition_2 THEN result_2
    ELSE some_other_result
END

-- Real world example
SELECT customer_id,first_name,last_name, -- CASE statement's col 
CASE
	WHEN (customer_id<=100) THEN 'Premium'
	WHEN (customer_id>100 AND customer_id<200) THEN 'Plus'
	ELSE 'General'
END AS status -- I'm changing the name of col
FROM customer

SELECT a, -- original col
CASE 
    WHEN a=1 THEN 'one' -- if true result will be return as string 'one' and as a new col, CASE
    WHEN a=2 THEN 'two'
    ELSE 'other' 
END AS label -- here we rename CASE col to label
FROM test_tbl

/* CASE expression syntax - in this case it firstly evaluates an expression then compares the result with 
     each value in the WHEN clauses sequentially, and the diff between general syntax is pretty subtle */

-- CASE Expression Syntax
CASE !expression!
    WHEN value_1 THEN result_1 -- value, no conditions 
    WHEN value_2 THEN result_2 -- value, -||-
    ELSE some_other_result
END

-- re-written the previous expression 
SELECT a,
    CASE a 
        WHEN 1 THEN 'one'
        WHEN 2 THEN 'two'
        ELSE 'other'
    END
FROM test_tbl
    
-- Real world example    
SELECT customer_id,first_name,last_name,-- CASE statement's col
CASE customer_id -- we're checking some values againts just this column 
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN '2nd place'
	ELSE 'Normal'
END AS raffle_res
FROM customer

SELECT  -- we're going to have 3 columns, since we have 3 CASE statements
SUM(CASE rental_rate 
	WHEN 0.99 THEN 1 -- counting rows that are equal to 0.99 and return this col #1
	ELSE 0
END) as bargains,
SUM (CASE rental_rate -- counting rows that are equal to 2.99 and return this col #2
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular,
SUM (CASE rental_rate -- counting rows that are equal to 4.99 and return this col #3
	WHEN 4.99 THEN 1
	ELSE 0
END) AS premium
FROM film

SELECT 
COUNT(CASE rating
	WHEN 'R' THEN 1 
END) AS r,
COUNT(CASE rating
	WHEN 'PG' THEN 1 
END) AS pg,
COUNT(CASE rating
	WHEN 'PG-13' THEN 1 
END) AS pg13
FROM film
