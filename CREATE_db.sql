-- CREATE Syntax
CREATE TABLE tbl_name(col_name TYPE col_constraint,
                      col_name TYPE col_constraint, -- do not miss commos 
                      tbl_constraint tbl_constraint -- For tables
) INHERITS existing_tbl_name;

-- A new table
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_name VARCHAR(100) UNIQUE NOT NULL,
	passowrd VARCHAR(50) NOT NULL,
	email VARCHAR(200) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP -- No constraints
)

-- A new tbl but associating/refering to another tbl, FK
CREATE TABLE account_job(
	user_id INTEGER REFERENCES account(user_id), -- account is table and user_id is column, creating a foreign key
	job_id INTEGER REFERENCES job(job_id), -- another relantion with the tbl JOB
	hire_date TIMESTAMP -- just having some info
)

