/*  DATA TYPES
COMMON:
#1 Boolean - True / False
#2 Character - char, varchar, and txt
#3 Numeric - integer and floating-point number
#4 Temporal - date, time, timestamp, and interval

UNCOMMON:
#5 UUID - Universally Unique Identifiers 
#6 Array 
#7 JSON
#8 Hstore key-value pair 
#9 Special types - such as Network address and Geometric data

-> Primary Key (PK): is a COLUMN/group of columns used to identify a row uniquely in a table 

-> Foreign Key (FK): is a FIELD/group of fields in a table that uniquely identifies a row in another table.
                     is defined in a tbl that references to the primary key of the other tbl.
            The tbl that CONTAINS the FK is called referencing tbl/CHILD tbl.
            The tbl to which the FK references is called referenced tbl/PARENT tbl. 
            A tbl can have multiple foreign keys

CONSTRAINTS - are the rules enforced on on data columns on table, to ensure the accuracy and reliability of the data in the DB
 