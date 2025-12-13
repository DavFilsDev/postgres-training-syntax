/*
==========================================================
 FILE: date_time_types.sql
 PURPOSE: Learn date and time data types in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) DATE TYPE
-- Stores only the date (year, month, day)
-- ========================================================

CREATE TABLE example_date (
    id SERIAL PRIMARY KEY,
    birth_date DATE -- only date, no time
);



-- ========================================================
-- 2) TIME TYPE
-- Stores only the time (hour, minute, second)
-- ========================================================

CREATE TABLE example_time (
    id SERIAL PRIMARY KEY,
    login_time TIME -- only time of dayr
);



-- ========================================================
-- 3) TIMESTAMP (Without timezone)
-- Stores date and time but no timezone info
-- ========================================================

CREATE TABLE example_timestamp (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP -- date + time (no timezone)
);



-- ========================================================
-- 4) TIMESTAMPTZ (Timestamp with timezone)
-- Most used in real backend applications
-- ========================================================

CREATE TABLE example_timestamptz (
    id SERIAL PRIMARY KEY,
    event_time TIMESTAMPTZ -- date + time + timezone
);



-- ========================================================
-- 5) INSERT EXAMPLES
-- ========================================================

-- Insert date
INSERT INTO example_date (birth_date)
VALUES ('2004-01-10');

-- Insert time
INSERT INTO example_time (login_time)
VALUES ('14:30:00');

-- Insert timestamp
INSERT INTO example_timestamp (created_at)
VALUES ('2026-02-17 10:45:00');

-- Insert timestamp with timezone (NOW() gives current date & time)
INSERT INTO example_timestamptz (event_time)
VALUES (NOW());



-- ========================================================
-- 6) SELECT EXAMPLES
-- ========================================================

-- Select all date/time examples
SELECT * FROM example_date;
SELECT * FROM example_time;
SELECT * FROM example_timestamp;
SELECT * FROM example_timestamptz;



-- ========================================================
-- 7) USEFUL DATE & TIME FUNCTIONS
-- ========================================================

-- Get current date
SELECT CURRENT_DATE;

-- Get current time
SELECT CURRENT_TIME;

-- Get current timestamp
SELECT CURRENT_TIMESTAMP;

-- Add 7 days to a date
SELECT CURRENT_DATE + INTERVAL '7 days';

-- Extract year from a date
SELECT EXTRACT(YEAR FROM birth_date) FROM example_date;



-- ========================================================
-- Notes:
-- DATE = only date
-- TIME = only time
-- TIMESTAMP = date + time (no timezone)
-- TIMESTAMPTZ = date + time + timezone (recommended)
-- NOW() = current date and time
-- INTERVAL = add or subtract time
-- ========================================================
