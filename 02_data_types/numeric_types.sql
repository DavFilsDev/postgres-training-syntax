/*
==========================================================
 FILE: numeric_types.sql
 PURPOSE: Learn numeric data types in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) INTEGER TYPES
-- Used for whole numbers (no decimals)
-- ========================================================

-- SMALLINT: small integer (-32,768 to 32,767)
CREATE TABLE example_smallint (
    id SERIAL PRIMARY KEY,
    age SMALLINT -- good for age, small counters
);

-- INTEGER (INT): standard integer
CREATE TABLE example_integer (
    id SERIAL PRIMARY KEY,
    quantity INT -- good for quantity, counters
);

-- BIGINT: very large integers
CREATE TABLE example_bigint (
    id SERIAL PRIMARY KEY,
    population BIGINT -- good for big numbers (countries, logs)
);



-- ========================================================
-- 2) DECIMAL / NUMERIC TYPES (Exact precision)
-- Used for money and financial data
-- ========================================================

CREATE TABLE example_numeric (
    id SERIAL PRIMARY KEY,
    price NUMERIC(10, 2) -- 10 total digits, 2 digits after decimal
);



-- ========================================================
-- 3) FLOATING POINT TYPES (Approximate values)
-- Used for scientific data, AI, sensors
-- ========================================================

CREATE TABLE example_float (
    id SERIAL PRIMARY KEY,
    temperature REAL,        -- single precision float
    distance DOUBLE PRECISION -- double precision float
);



-- ========================================================
-- 4) INSERT EXAMPLES
-- ========================================================

-- Insert integer values
INSERT INTO example_integer (quantity) VALUES (10), (20), (30);

-- Insert numeric (money)
INSERT INTO example_numeric (price) VALUES (99.99), (1234.50);

-- Insert float values
INSERT INTO example_float (temperature, distance)
VALUES (36.6, 12345.6789);



-- ========================================================
-- 5) SELECT EXAMPLES
-- ========================================================

-- Select all numeric examples
SELECT * FROM example_integer;
SELECT * FROM example_numeric;
SELECT * FROM example_float;



-- ========================================================
-- 6) CASTING (Convert one type to another)
-- ========================================================

-- Convert integer to numeric
SELECT quantity::NUMERIC FROM example_integer;

-- Convert numeric to integer (decimal part removed)
SELECT price::INT FROM example_numeric;



-- ========================================================
-- Notes:
-- SMALLINT = small whole numbers
-- INT = standard whole numbers
-- BIGINT = very large numbers
-- NUMERIC/DECIMAL = exact precision (money)
-- REAL / DOUBLE PRECISION = approximate decimal values
-- Casting (::type) converts data type
-- ========================================================
