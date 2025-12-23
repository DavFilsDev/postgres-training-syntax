/*
===========================================================
 File: indexes.sql
 Description: Examples of PostgreSQL indexes
 Author: David (SQL Training Project)
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) CREATE SIMPLE INDEX
-- Speeds up queries on a column
-- =========================================================

-- Example table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC
);

-- Create index on department for faster search
CREATE INDEX idx_department ON employees(department);

-- Now queries filtering by department are faster
-- SELECT * FROM employees WHERE department = 'IT';



-- =========================================================
-- 2) UNIQUE INDEX
-- Ensures column values are unique and speeds up searches
-- =========================================================

CREATE UNIQUE INDEX idx_unique_email ON employees(name);

-- Example:
-- INSERT INTO employees (name) VALUES ('Alice'); -- ok
-- INSERT INTO employees (name) VALUES ('Alice'); -- error, duplicate



-- =========================================================
-- 3) COMPOSITE INDEX
-- Index multiple columns together
-- =========================================================

CREATE INDEX idx_dept_salary ON employees(department, salary);

-- Example query benefits from composite index
-- SELECT * FROM employees 
-- WHERE department = 'IT' AND salary > 3000;



-- =========================================================
-- 4) PARTIAL INDEX
-- Index only rows meeting a condition
-- =========================================================

CREATE INDEX idx_high_salary ON employees(salary)
WHERE salary > 5000;

-- Only employees with salary > 5000 are indexed
-- Useful for filtering large tables on important conditions



-- =========================================================
-- 5) UNIQUE CONSTRAINT (INDEX IMPLICITLY CREATED)
-- =========================================================

-- Adding UNIQUE constraint automatically creates an index
ALTER TABLE employees
ADD CONSTRAINT unique_name UNIQUE(name);



-- =========================================================
-- 6) DROP INDEX
-- =========================================================

-- Drop index if no longer needed
-- DROP INDEX idx_department;



-- =========================================================
-- Notes:
-- Index = speeds up SELECT queries
-- Types:
--  - SIMPLE: one column
--  - UNIQUE: unique values
--  - COMPOSITE: multiple columns
--  - PARTIAL: conditional index
-- Indexes do NOT speed up INSERT/UPDATE much, may slow them down slightly
-- Always index columns used in WHERE, JOIN, ORDER BY
-- =========================================================
