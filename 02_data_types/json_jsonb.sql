/*
==========================================================
 FILE: json_jsonb.sql
 PURPOSE: Learn JSON and JSONB data types in PostgreSQL
 AUTHOR: David RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) JSON TYPE (Stores JSON as text)
-- Keeps original format (spaces, order)
-- ========================================================

CREATE TABLE example_json (
    id SERIAL PRIMARY KEY,
    data JSON -- stores JSON exactly as inserted
);



-- ========================================================
-- 2) JSONB TYPE (Binary JSON - optimized)
-- Faster for queries, recommended in backend apps
-- ========================================================

CREATE TABLE example_jsonb (
    id SERIAL PRIMARY KEY,
    data JSONB -- stores JSON in binary optimized format
);



-- ========================================================
-- 3) INSERT JSON DATA
-- ========================================================

-- Insert into JSON table
INSERT INTO example_json (data)
VALUES (
    '{"name": "David", "age": 21, "skills": ["Python", "PostgreSQL", "Cybersecurity"]}'
);

-- Insert into JSONB table
INSERT INTO example_jsonb (data)
VALUES (
    '{"name": "Alice", "age": 25, "skills": ["Java", "React"]}'
);



-- ========================================================
-- 4) SELECT JSON DATA
-- ========================================================

-- Select all JSON data
SELECT * FROM example_json;
SELECT * FROM example_jsonb;



-- ========================================================
-- 5) ACCESS JSON FIELDS
-- ========================================================

-- Get name field as JSON
SELECT data->'name' FROM example_jsonb;

-- Get name field as TEXT
SELECT data->>'name' FROM example_jsonb;

-- Get age field
SELECT data->>'age' FROM example_jsonb;



-- ========================================================
-- 6) FILTER WITH JSON FIELDS
-- ========================================================

-- Select rows where name = 'Alice'
SELECT * FROM example_jsonb
WHERE data->>'name' = 'Alice';



-- ========================================================
-- 7) UPDATE JSON DATA
-- ========================================================

-- Update JSON field (change age)
UPDATE example_jsonb
SET data = jsonb_set(data, '{age}', '30')
WHERE data->>'name' = 'Alice';



-- ========================================================
-- 8) DELETE JSON FIELD
-- ========================================================

-- Remove the age field from JSON
UPDATE example_jsonb
SET data = data - 'age'
WHERE data->>'name' = 'Alice';



-- ========================================================
-- Notes:
-- JSON = stored as text, slower for queries
-- JSONB = binary format, faster and recommended
-- -> returns JSON value
-- ->> returns TEXT value
-- jsonb_set() updates JSON fields
-- data - 'field' removes a JSON key
-- ========================================================
