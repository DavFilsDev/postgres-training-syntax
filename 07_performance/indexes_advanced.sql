/*
===========================================================
 File: indexes_advanced.sql
 Description: Examples of advanced indexing techniques in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) UNIQUE INDEX
-- Ensures column values are unique and improves query speed
-- =========================================================

CREATE UNIQUE INDEX idx_students_email ON students(email);

-- Now no two students can have the same email
-- Queries filtering on email will be faster



-- =========================================================
-- 2) COMPOSITE INDEX
-- Index on multiple columns to optimize multi-column queries
-- =========================================================

CREATE INDEX idx_students_class_name ON students(class_id, name);

-- Queries like below use this index efficiently
EXPLAIN ANALYZE
SELECT * FROM students
WHERE class_id = 1 AND name = 'Alice';



-- =========================================================
-- 3) PARTIAL INDEX
-- Index only a subset of rows to save space
-- =========================================================

CREATE INDEX idx_students_active ON students(name)
WHERE is_active = true;

-- Optimizes queries filtering only active students
EXPLAIN ANALYZE
SELECT * FROM students
WHERE is_active = true AND name = 'Alice';



-- =========================================================
-- 4) FUNCTIONAL INDEX
-- Index based on expression or function
-- =========================================================

-- Index on lower(name) to allow case-insensitive search
CREATE INDEX idx_students_name_lower ON students(LOWER(name));

-- Now queries like this are fast
SELECT * FROM students WHERE LOWER(name) = 'alice';



-- =========================================================
-- 5) GIN INDEX (for array, JSON, full-text search)
-- =========================================================

-- Example: jsonb column
-- CREATE INDEX idx_students_preferences ON students USING GIN (preferences);

-- Example: full-text search
-- CREATE INDEX idx_students_search ON students USING GIN (to_tsvector('english', name));



-- =========================================================
-- 6) NOTES
-- =========================================================

-- Advanced indexing tips:
-- - UNIQUE INDEX: enforce uniqueness and speed up lookups
-- - COMPOSITE INDEX: for multi-column WHERE conditions
-- - PARTIAL INDEX: save space, optimize selective queries
-- - FUNCTIONAL INDEX: index expressions or functions (e.g., LOWER)
-- - GIN/ GiST INDEX: for JSON, arrays, full-text search
-- - Always check query plans with EXPLAIN ANALYZE
