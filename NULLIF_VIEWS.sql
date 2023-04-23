/* NULLIF function takes in 2 inputs and returns NULL if both are equal,
    otherwise it returns the 1st argument passed  */

NULLIF(arg1,arg2)
NULLIF(10,10) -- returns NULL
NULLIF(10,12) -- returns 10

-- Calculate department ration  
 SELECT (
 SUM(CASE WHEN department='A' THEN 1 ELSE 0 END)/ -- 2/1
	 NULLIF(SUM(CASE WHEN department='B' THEN 1 ELSE 0 END),0)
	 ) AS department_ration
 FROM depts

 /* VIEWS - is a database object that is of a stored querry 
    VIEWS can be viewed as virtual DB */

-- create a new view 
CREATE VIEW customer_info AS 
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id=address.address_id

-- run this view
SELECT * FROM customer_info

-- modify an existing VIEW
CREATE OR REPLACE VIEW customer_info AS 
SELECT first_name,last_name,address,district FROM customer
INNER JOIN address
ON customer.address_id=address.address_id

-- Remove VIEW
DROP VIEW IF EXISTS customer_info

-- Modify the name of the VIEW
ALTER VIEW customer_info RENAME TO c_info