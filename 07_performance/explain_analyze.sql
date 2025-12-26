/*
===========================================================
 File: explain_analyze.sql
 Description: Examples of EXPLAIN and EXPLAIN ANALYZE in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) EXPLAIN
-- Shows the execution plan of a query without running it
-- =========================================================

-- Check how a simple SELECT would execute
EXPLAIN
SELECT * FROM students
WHERE name LIKE 'A%';

-- Output shows:
-- - Seq Scan = sequential scan (reads all rows)
-- - Index Scan = using an index if exists
-- - Cost estimates, rows, and width



-- =========================================================
-- 2) EXPLAIN ANALYZE
-- Runs the query and shows actual execution stats
-- =========================================================

EXPLAIN ANALYZE
SELECT * FROM students
WHERE name LIKE 'A%';

-- Output includes:
-- - Actual time taken for each step
-- - Number of rows returned
-- - Total runtime
-- Useful to detect slow queries and bottlenecks



-- =========================================================
-- 3) EXPLAIN WITH VERBOSE AND BUFFERS
-- More detailed information
-- =========================================================

EXPLAIN (ANALYZE, VERBOSE, BUFFERS)
SELECT s.id, s.name, AVG(g.grade) AS avg_grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.name;

-- VERBOSE = shows internal node details
-- BUFFERS = shows disk I/O info (shared, local buffers)



-- =========================================================
-- 4) NOTES
-- =========================================================

-- EXPLAIN helps plan indexing and optimization
-- EXPLAIN ANALYZE shows actual runtime
-- Use these before creating indexes or optimizing queries
-- Helps detect:
-- - Sequential scans on large tables
-- - Inefficient joins
-- - Bottlenecks in WHERE / GROUP BY clauses
