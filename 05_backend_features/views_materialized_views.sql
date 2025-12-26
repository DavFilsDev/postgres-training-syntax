/*
===========================================================
 File: views_materialized_views.sql
 Description: Examples of PostgreSQL views and materialized views
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) SIMPLE VIEW
-- A view is a saved query, acts like a virtual table
-- =========================================================

-- Create a view of students with their average grade
CREATE OR REPLACE VIEW student_avg_view AS
SELECT 
    s.id AS student_id,
    s.name AS student_name,
    AVG(g.grade) AS avg_grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.name;

-- Query the view
SELECT * FROM student_avg_view;

-- View is read-only by default (cannot directly insert/update)



-- =========================================================
-- 2) MATERIALIZED VIEW
-- Stores the result physically for faster access
-- =========================================================

-- Create a materialized view of top students
CREATE MATERIALIZED VIEW top_students_mv AS
SELECT 
    s.id AS student_id,
    s.name AS student_name,
    AVG(g.grade) AS avg_grade
FROM students s
LEFT JOIN grades g ON s.id = g.student_id
GROUP BY s.id, s.name
HAVING AVG(g.grade) >= 15
ORDER BY avg_grade DESC;

-- Query the materialized view
SELECT * FROM top_students_mv;

-- Refresh the materialized view if underlying data changes
REFRESH MATERIALIZED VIEW top_students_mv;



-- =========================================================
-- 3) NOTES
-- =========================================================

-- VIEW:
-- - Virtual table
-- - Always shows latest data
-- - Cannot be indexed directly
-- - Use for abstraction, simplified queries

-- MATERIALIZED VIEW:
-- - Stores results physically
-- - Faster for large aggregations
-- - Needs REFRESH to update data
-- - Can have indexes to improve performance
