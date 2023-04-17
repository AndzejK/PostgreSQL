/*
    JOIN - allows us to combine info from multiple tables:
        # INNER JOIN - columns that match in both tables, symmentrical tables = SAME, Default JOIN!
        # OUTER JOIN - 2.1 FULL OUTER JOIN: clarifying WHERE null
                       2.2 LEFT OUTER JOIN: clarifying WHERE null - Assymetrical tbls and thus OREDER of tbl matters!!
                       2.3 RIGHT OUTER JOIN: clarifying WHERE null
        # FULL JOIN -
        # UNIONS -
*/
-- INNER JOIN - matching all results then are existing! --
SELECT * FROM Table_A
INNER JOIN Table_B 
ON Table_A.col_MATCH_1=Table_B.col_MATCH_1


SELECT payment.customer_id,first_name,last_name,email FROM payment -- payment.customer_id is in both tbls and thus we need to specify tbl
INNER JOIN customer
ON payment.customer_id=customer.customer_id
GROUP BY first_name,last_name,email,payment.customer_id -- However, in the header is unique across tbls then we write JUST column's name
ORDER BY first_name

/* 2. OUTER JOIN 
   2.1 FULL OUTER JOIN - it grabs EVERYTHING, meaning whether it present in both tbls or just one, if no record then is equel to NULL 
        if I can't find value matchig from Table_A then will be NULL AND 
        if I can't find value matchig from Table_B then will be NULL 
        if I find the match I just join them and those matches will make smallet tbl than just joining all results
*/   
SELECT * FROM Table_A
FULL OUTER JOIN Table_B 
ON Table_A.col_MATCH_1=Table_B.col_MATCH_1

-- Return all values than don't match using FULL OUTER JOIN with WHERE
SELECT * FROM Table_A
FULL OUTER JOIN Table_B 
ON Table_A.col_MATCH_1=Table_B.col_MATCH_1
WHERE Table_A.col_UNMATCH_1 IS null OR Table_B.col_UNMATCH_2 IS null -- Now we're going to have unique rows the outcome tbl OPPOSITE to INNER JOIN

-- For instance we have the tbl with customers and another tbl where cx made some payments
-- using FULL OUTER JOIN  we can find cx who have not made any purchase
-- thie querry is checking all payments have cx info 
SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id=payment.customer_id
WHERE customer.customer_id IS null OR payment.payment_id IS null 

/* 2. OUTER JOIN 
   2.2 LEFT OUTER JOIN  - This type of join returns all records from the left table, and only matching records from the right table.
If there is no matching record in the right table, the result will still contain the record from the left table, but with null values for the columns from the right table. */

SELECT * FROM Table_A -- Order of the tbls matters!!
LEFT OUTER JOIN Table_B 
ON Table_A.col_MATCH_1=Table_B.col_MATCH_1

/* LEFT OUTER JOIN with WHERE - clarifying to get unique rows to the left table!
meaning find ROWS in tbl A and NOT found in tbl B */

SELECT * FROM Table_A -- Order of the tbls matters!!
LEFT OUTER JOIN Table_B 
ON Table_A.col_MATCH_1=Table_B.col_MATCH_1
WHERE Table_B.id IS null -- then we will find unique values that did not match with table B on the right 

-- In the film tbl we have info about a film in inventory tbl we make sure that we have this fil for sale
-- Now we take name film and checking in it's one of our stores, this table is on the right
-- NULL on the right is telling us we do have some info about this film but we don't have it for sale 
SELECT film.film_id,title,inventory_id,store_id FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id=film.film_id
WHERE inventory.film_id IS null

/* 2. OUTER JOIN 
   2.3 RIGHT OUTER JOIN */
