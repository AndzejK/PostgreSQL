/* 
    PostgreSQL - free, OpenSource, multi platform 
    PGadmin as GUI to access PostgreSQL engine/DB
*/
-- port 5432
SELECT column_name_1, header_name_2 FROM tbl_name -- * all columns

SELECT DISTINCT(column) FROM tbl_name -- DDISTINCT keyword operates ON a column, 
                                      -- grab just UNIQUE values of this column

SELECT COUNT(colum_name) FROM tbl_name -- will count ALL values for this column
                                       -- It returns a count of the number of rows in a table
SELECT COUNT(DISTINCT(colum_name)) FROM tbl_name; -- from LEFT to RIGHT, (1)getting a tbl, (2)finding the unique values
                                                  -- a tbl, (3) a getting a count of the unique rows
WHERE -- Conditions, <> OR != Not equal to / AND OR NOT 

SELECT colum_names FROM tbl_name
WHERE conditions_1>4.55 AND conditions_2 >=19.99;

ORDER BY -- to sort rows based on a column value, either ascending or descending value

SELECT column_name_1,column_name_2, column_name_3 FROM tbl_name
WHERE conditions_1>0.00 AND conditions_2 >=0.000
ORDER BY column_name_1, column_name_3 ASC/DESC -- ascending order is default behaviour we can order by multiple columns
                                               -- firstly will be order by column_name_1, like companies name
                                               -- later by column_name_3, like sales by ascending or descending value
LIMIT -- this command allows us to limit the number of rows returned for a query, it's the LAST command in the query
      -- LIMIT goes well in conjuction with ORDER BY
SELECT * FROM payment
WHERE amount<>0 -- NOT o
ORDER BY payment_date DESC -- by descending order
LIMIT 5; -- show me just 5 rows
