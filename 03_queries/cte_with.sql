/*
==========================================================
 FILE: cte_with.sql
 PURPOSE: Learn Common Table Expressions (CTE) with WITH
 AUTHOR: David RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- ========================================================
-- 1) BASIC CTE (WITH)
-- A CTE is a temporary query you can reuse
-- ========================================================

WITH student_list AS (
    SELECT id, first_name, last_name
    FROM students
)
SELECT * FROM student_list; -- use the CTE like a table



-- ========================================================
-- 2) CTE WITH JOIN
-- Use CTE to simplify complex JOIN queries
-- ========================================================

WITH student_courses AS (
    SELECT students.first_name, courses.course_name
    FROM students
    JOIN enrollments ON students.id = enrollments.student_id
    JOIN courses ON enrollments.course_id = courses.id
)
SELECT * FROM student_courses;



-- ========================================================
-- 3) CTE WITH AGGREGATION
-- Count courses per student using CTE
-- ========================================================

WITH course_count AS (
    SELECT student_id, COUNT(course_id) AS total_courses
    FROM enrollments
    GROUP BY student_id
)
SELECT students.first_name, course_count.total_courses
FROM students
LEFT JOIN course_count ON students.id = course_count.student_id;



-- ========================================================
-- 4) MULTIPLE CTEs
-- You can define more than one CTE
-- ========================================================

WITH 
all_students AS (
    SELECT id, first_name FROM students
),
all_courses AS (
    SELECT id, course_name FROM courses
)
SELECT * FROM all_students, all_courses; -- cross join example



-- ========================================================
-- 5) RECURSIVE CTE (Basic example)
-- Used for hierarchies (categories, trees)
-- ========================================================

-- Example table for hierarchy
-- CREATE TABLE categories (
--     id SERIAL PRIMARY KEY,
--     name TEXT,
--     parent_id INT REFERENCES categories(id)
-- );

-- Recursive query to show category tree
WITH RECURSIVE category_tree AS (
    -- Base query (root categories)
    SELECT id, name, parent_id
    FROM categories
    WHERE parent_id IS NULL

    UNION ALL

    -- Recursive query (child categories)
    SELECT c.id, c.name, c.parent_id
    FROM categories c
    INNER JOIN category_tree ct ON c.parent_id = ct.id
)
SELECT * FROM category_tree;



-- ========================================================
-- Notes:
-- WITH = defines a temporary query (CTE)
-- CTE improves readability and reuse
-- Multiple CTEs can be defined
-- RECURSIVE CTE = used for trees and hierarchies
-- ========================================================
