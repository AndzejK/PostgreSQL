-- INSERT allows us to add the rows to a tbl
-- Syntex
INSERT INTO tbl_name(column_name_1,column_name_2,...)
VALUES (value_1,value_1,...)

-- Choosing values from another tbl
INSERT INTO tbl_name(column_name_1,column_name_2,...)
SELECT column_name_1,column_name_2,...
FROM another_tbl
WHERE conditions_1

INSERT INTO account(username,passowrd,email,created_on)
VALUES ('sql_1','sql_123','sqlbros@bro.net',CURRENT_TIMESTAMP)

-- Insert value having foreign keys as constraint
INSERT INTO account_job (user_id,job_id,hire_date)
VALUES (3,2,CURRENT_TIMESTAMP) -- user_is=3 doesn't exist in account tbl and thus I get error - ERROR:  Key (user_id)=(3) is not present in table "account".insert or update on table "account_job" violates foreign key constraint "account_job_user_id_fkey" 