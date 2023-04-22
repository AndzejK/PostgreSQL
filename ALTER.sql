/* ALTER clause allows us to change an existing table structure, such as:
    # Adding, dropping, or renaiming columns 
    # Changing a column's data type
    # Set DEFAULT values for a column
    # Add CHECK constraints
    # Rename tables
*/

-- General Syntex
ALTER TABLE tbl_name action
-- e.x.removing columns
ALTER TABLE tbl_name
DROP COLUMN col_name

-- Rename a table
ALTER TABLE information
RENAME TO new_info

-- Rename a column's (header) name  
ALTER TABLE new_info
RENAME COLUMN person to people

-- Alter constraints on the existing columns
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL -- if want to SET a constaint then i should use SET

-- Remove the whole column
ALTER TABLE new_info
DROP COLUMN people

-- Remove the whole column if it EXISTS 
ALTER TABLE new_info
DROP COLUMN IF EXISTS people