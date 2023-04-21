-- General Syntax
UPDATE tbl 
SET column_name_1=value_1,
    column_name_2=value_2
WHERE conditions_1;

UPDATE account
SET created_on=last_login

-- update value based off a diff tbl
UPDATE account_job -- tbl
SET hire_date=account.created_on -- what to update
FROM account -- from which tbl
WHERE account_job.user_id=account.user_id -- INNER JOIN  what excatly I need to update based off another results

-- Update and return columns which I'm interested in
UPDATE account
SET last_login=CURRENT_TIMESTAMP
RETURNING email,created_on,last_login