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

-- Subquery with IN, similar to JOINs
SELECT student,grade FROM test_scores
WHERE student IN (SELECT student FROM honor_roll_tbl) -- here we compare two Strings !

-- The EXISTS operator - is used to test for the existence of rows in a subquery, typically is a subquery is passed in the EXIST() function
-- to check if any rows are returned with the subquery.



