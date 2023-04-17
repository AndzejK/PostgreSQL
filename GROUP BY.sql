/* SQL Aggregate functions - MIN, MAX, AVG etc.
The main aim of aggregate function is to take multiple inputs and return a signle output */

-- Since it returns a single value either we apply another aggregate fn or don't select other columns 
SELECT MAX(replacement_cost),MIN(replacement_cost),ROUND(AVG(replacement_cost),2) FROM film

/* GROUP BY allows us to aggregate columns per some category
1) We need to choose a CATEGORICAL column to GROUP BY
2) We choose an aggregate function to perform some calculation 

! In the SELECT statement, columns must either have an aggregate fn OR be in the GROUP BY call !
IF -> SELECT category_col_1,category_col_2, MAX(data_col) -- But aggregate fn just can be in SELECT statement and GROUP BY does not matter
      FROM tbl
      GROUP BY category_col_1,category_col_2 -- category_col_1 should be in SELECT and GROUP BY

*/

SELECT customer_id,SUM(amount) FROM payment -- We group a cx and calc a sum, technically how much cx spend $
GROUP BY customer_id -- customer_id in both places!!
ORDER BY SUM(amount) DESC

SELECT staff_id,customer_id, COUNT(amount),SUM(amount),MIN(amount),MAX(amount),ROUND(AVG(amount),2) FROM payment
GROUP BY staff_id,customer_id
ORDER BY COUNT(amount) DESC;

SELECT DATE(payment_date),SUM(amount) FROM payment -- we extract just DAY rather then and time = "2007-04-30"
GROUP BY DATE(payment_date) -- it's essentials to add here DATE(payment_date)
ORDER BY SUM(amount) DESC
 
