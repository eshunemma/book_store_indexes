SELECT * 
FROM customers
LIMIT 10;

SELECT * 
FROM orders
LIMIT 10;

SELECT *
FROM books
LIMIT 10;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';


SELECT *
FROM pg_Indexes
WHERE tablename = 'books';


SELECT *
FROM pg_Indexes
WHERE tablename = 'orders';

CREATE INDEX customer_id_idx ON 
orders (customer_id);

CREATE INDEX book_id_idx ON 
orders(book_id);

--Examine runtime
EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French'; 

--size of table 
SELECT pg_size_pretty
(pg_total_relation_size('books'));

CREATE INDEX books_original_language_title_sales_in_millions_idx ON 
books(original_language, title, sales_in_millions);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French'; 

--size of table 
SELECT pg_size_pretty
(pg_total_relation_size('books'));

--delete multicolumn
DROP INDEX IF EXISTS books_original_language_title_sales_in_millions_idx; 

EXPLAIN ANALYZE SELECT *
FROM orders;

SELECT NOW();
 
\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
 
SELECT NOW();

DROP INDEX IF EXISTS customer_id_idx;
DROP INDEX IF EXISTS book_id_idx;

EXPLAIN ANALYZE SELECT *
FROM orders;

CREATE INDEX customer_id_idx ON 
orders (customer_id);

CREATE INDEX book_id_idx ON 
orders(book_id);

EXPLAIN ANALYZE SELECT *
FROM orders;

CREATE INDEX customers_first_name_email_address ON 
customers(first_name, email_address);