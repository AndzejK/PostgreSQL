/* HAVING clause - allows us to filter AFTER an aggregation has already taken place! 
   WHERE ~ like but only what was aggregated through GROUP BY!
*/

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount)>200
ORDER BY SUM(amount) DESC

SELECT staff_id,customer_id, SUM(amount) FROM payment
WHERE staff_id=2
GROUP BY staff_id,customer_id
HAVING SUM(amount)>100


