/*
===========================================================
 File: partitioning.sql
 Description: Examples of table partitioning in PostgreSQL
 Author: David (SQL Training Project)
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) RANGE PARTITIONING
-- Split table into ranges based on a column
-- =========================================================

-- Create parent table (no data stored here)
CREATE TABLE orders (
    order_id SERIAL,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC
) PARTITION BY RANGE (order_date);

-- Create partitions
CREATE TABLE orders_2025 PARTITION OF orders
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE orders_2026 PARTITION OF orders
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Insert data automatically goes into correct partition
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1, '2025-05-10', 200),
       (2, '2026-02-17', 150);



-- =========================================================
-- 2) LIST PARTITIONING
-- Split table based on specific values
-- =========================================================

-- Create parent table
CREATE TABLE employees_partitioned (
    id SERIAL,
    name VARCHAR(100),
    department VARCHAR(50)
) PARTITION BY LIST (department);

-- Create partitions
CREATE TABLE emp_it PARTITION OF employees_partitioned
    FOR VALUES IN ('IT');

CREATE TABLE emp_hr PARTITION OF employees_partitioned
    FOR VALUES IN ('HR');

-- Insert data goes to correct partition automatically
INSERT INTO employees_partitioned (name, department)
VALUES ('Alice', 'IT'),
       ('Bob', 'HR');



-- =========================================================
-- 3) HASH PARTITIONING
-- Split table based on hash function of a column
-- =========================================================

CREATE TABLE payments (
    payment_id SERIAL,
    customer_id INT,
    amount NUMERIC
) PARTITION BY HASH (customer_id);

-- Create partitions
CREATE TABLE payments_part0 PARTITION OF payments
    FOR VALUES WITH (MODULUS 2, REMAINDER 0);

CREATE TABLE payments_part1 PARTITION OF payments
    FOR VALUES WITH (MODULUS 2, REMAINDER 1);

-- Inserts automatically distributed
INSERT INTO payments (customer_id, amount)
VALUES (1, 100), (2, 200), (3, 150);



-- =========================================================
-- Notes:
-- RANGE: partition by value ranges (dates, numbers)
-- LIST: partition by specific values (categories)
-- HASH: partition by hash function (even distribution)
-- Parent table stores no data, only structure
-- Querying parent table queries all partitions automatically
-- Partitioning is for very large tables to improve performance
-- =========================================================
