/* COALESCE - this function accepts an unlimited num of arguments and 
it returns the 1st argument that is NOT NULL, but if all args are NULL then it returns NULL 

The COALESCE fn is useful when querying a tbl that contains NULL values and I wan to
subsitute it with another value!

Like having a col with original price and another col with discount but perhaps not every item has a discount
and thus it would have NULL value but later on we want to gauge final price and this case COALESCE fn becomes handy

*/
SELECT COALESCE(1,2) -- returns 1!
SELECT COALESCE(NULL,2,3) -- returns 2!

SELECT item,(price-COALESCE(discount,0)) AS final 
FROM tbl

SELECT name, job_title, COALESCE(salary, 'unknown') as salary
FROM employees;

/* CAST - operator allows me to convert form one data type to another  */
-- Syntax
SELECT CAST('5'AS INTEGER) -- converting/casting

SELECT '123' AS txt, CAST('123'AS INTEGER) AS num

-- In this case I have ID of x number and thus I want to find out the lenght of IDs
-- so I can cast int into string and count the characters 
SELECT DISTINCT(CHAR_LENGTH(CAST(inventory_id AS VARCHAR))) FROM rental