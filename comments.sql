---In Oracle SQL, you can add a comment to a table row by using the COMMENT command to annotate columns or the table itself, but you can't directly comment on individual rows. Comments can only be applied to tables and columns for documentation purposes.

---Here's an example of how to comment on a table and a column:

---1. Comment on a Table:

COMMENT ON TABLE table_name IS 'This table stores customer information.';
--2. Comment on a Column:

COMMENT ON COLUMN table_name.column_name IS 'This column holds the customer first name.';
--To document specific rows, you could add a "comments" column to your table and manually insert comments in the corresponding rows.


ALTER TABLE table_name ADD (comments VARCHAR2(255));

UPDATE table_name
SET comments = 'This row contains priority customer information'
WHERE id = 123;
