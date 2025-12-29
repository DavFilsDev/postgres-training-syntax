/*
===========================================================
 File: query_optimization.sql
 Description: Examples of query optimization techniques in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) USING INDEXES
-- Ensure queries use indexes for faster lookups
-- =========================================================

-- Create an index on the students.name column
CREATE INDEX idx_students_name ON students(name);

-- After creating the index, queries filtering on name are faster
EXPLAIN ANALYZE
SELECT * FROM students WHERE name = 'Alice';



-- =========================================================
-- 2) LIMIT AND OFFSET
-- Reduce the number of rows returned for performance
-- =========================================================

-- Fetch first 10 students only
SELECT * FROM students
ORDER BY id
LIMIT 10;



-- =========================================================
-- 3) SELECT ONLY NEEDED COLUMNS
-- Avoid SELECT * for large tables
-- =========================================================

-- Only select name instead of all columns
SELECT name FROM students WHERE class_id = 1;



-- =========================================================
-- 4) AVOID N+1 QUERIES WITH JOIN
-- Fetch related data in one query instead of multiple queries
-- =========================================================

-- Bad: multiple queries (N+1 problem)
-- SELECT * FROM students WHERE id = 1;
-- SELECT * FROM grades WHERE student_id = 1;

-- Good: join tables in one query
SELECT s.id, s.name, g.subject, g.grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
WHERE s.id = 1;



-- =========================================================
-- 5) USE CTEs AND SUBQUERIES WISELY
-- Can simplify queries but check performance
-- =========================================================

-- CTE example
WITH top_students AS (
    SELECT student_id, AVG(grade) AS avg_grade
    FROM grades
    GROUP BY student_id
    HAVING AVG(grade) >= 15
)
SELECT s.name, t.avg_grade
FROM top_students t
JOIN students s ON s.id = t.student_id;



-- =========================================================
-- 6) VACUUM AND ANALYZE
-- Keep table stats updated for optimizer
-- =========================================================

-- Reclaim space and update statistics
VACUUM ANALYZE students;
VACUUM ANALYZE grades;



-- =========================================================
-- 7) NOTES
-- =========================================================

-- Query optimization tips:
-- - Use indexes for columns in WHERE, JOIN, ORDER BY
-- - Avoid SELECT *; fetch only needed columns
-- - Use LIMIT when only a subset is needed
-- - Use JOINs instead of multiple queries to prevent N+1 problem
-- - Analyze table statistics regularly for planner efficiency
-- - Test performance with EXPLAIN ANALYZE
