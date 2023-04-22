/* CASE statement is used when only a certain condition is met (like IF/ELSE) */

-- General Syntax
CASE -- No expression 
    WHEN condition_1 THEN result_1
    WHEN condition_2 THEN result_2
    ELSE some_other_result
END

SELECT a, -- original col
CASE 
    WHEN a=1 THEN 'one' -- if true result will be return as string 'one' and as a new col, CASE
    WHEN a=2 THEN 'two'
    ELSE 'other' AS label -- here we rename CASE col to label
END
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
    



