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
