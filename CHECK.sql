-- CHECK constraint allows us to create more customized constraints that adhere to a certain condition 
-- General Syntax
CREATE TABLE example(
    ex_id SERIAL PRIMARY KEY,
    age SMALLINT CHECK (age>21) -- here is our customized CHECK
    parent_age SMALLINT CHECK(parent_age>age)
);

CREATE TABLE emplyees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(70) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	birthdate DATE CHECK (birthdate>'1900-01-01'),
	hire_date DATE CHECK(hire_date>birthdate),
	salary  INTEGER CHECK (salary>0)
)