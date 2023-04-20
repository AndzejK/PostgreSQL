 -- https://www.postgresql.org/docs/current/functions-string.html

SELECT LENGTH(first_name) as len, first_name FROM customer
WHERE LENGTH(first_name)>9

-- The string concatenation operator (||) 
SELECT first_name||' '||last_name as full_name FROM customer -- adding in column first nad last name plus adding in between empty space
WHERE (LENGTH(first_name||' '||last_name))>17

-- generate emails from first name and last name, or perhaps using just the fisrt letter of the first name and concetinate it with the last name
SELECT LOWER(first_name)||'.'||LOWER(last_name)||'@gmail.com' as email FROM customer
-- just first letter of the fisrt name and the last name
SELECT LOWER(LEFT(first_name,1))||'.'||LOWER(last_name)||'@gmail.com' as email FROM customer

/* SubQuery - will allow me to construct complex queries, 
    essentially performing a querry on the results of another query, having to SELECT statements 
    We can use IN operator in conjusction with a subquery to check against multiple results returned */
SELECT studentID,grade FROM test_scores
WHERE grade>(SELECT AVG(grade)FROM test_scores) -- here we compare two Integers !
-- The subquery is performed firt since it is in the parenthesis !!!
--  AVG(grade) returns just ONE value and thus is okay to use comparison operator !!
-- if it would return multiple values then we had to use IN oprator !!

-- Subquery with IN, similar to JOINs
SELECT student,grade FROM test_scores
WHERE student IN (SELECT student FROM honor_roll_tbl) -- here we compare two Strings !

-- The EXISTS operator - is used to test for the existence of rows in a subquery, typically is a subquery is passed in the EXIST() function

SELECT first_name,last_name
FROM customer AS c -- customer_id,
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id=c.customer_id AND amount>11)

-- to check if any rows are returned with the subquery.

SELECT film_id,title FROM film -- 3) find tile of the film based on film_id
WHERE film_id IN
(SELECT film_id FROM rental -- 2) Find film_id 
INNER JOIN inventory
ON inventory.inventory_id=rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30') -- 1) I find time range


/*  SELF-JOIN - is a query in which a table is joined to itself, useful for comparing values 
    within the SAME table. JOIN keywords is used since it's the same tbl ALIAS is needed */

-- Syntax for Self-Join
SELECT Table_A.col,Table_B.col
FROM table_1 as Table_A -- Different alianses for the same tbl
JOIN table_1 as Table_B -- ALias is needed to organise query 
ON Table_A.some_col=Table_B.other_col  

-- Here we're getting the film's title that matches the length with onther films
SELECT f1.title,f2.title,f1.length 
FROM film AS f1
INNER JOIN film AS f2 
ON f1.film_id<>f2.film_id AND f1.length=f2.length -- 1. film id in the same tbl needs to be different coz we will compare with another film not with itself, BUT the legth needs to match 