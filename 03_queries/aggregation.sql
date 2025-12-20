/*
===========================================================
 File: aggregation.sql
 Description: Examples of aggregation queries in SQL
 Author: David (SQL Training Project)
===========================================================
*/

-- =========================================================
-- BASIC AGGREGATION FUNCTIONS
-- =========================================================

-- Count total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- Count students per promotion
SELECT promotion_id, COUNT(*) AS student_count
FROM students
GROUP BY promotion_id;

-- Get the average grade of all students
SELECT AVG(grade) AS average_grade
FROM grades;

-- Get the maximum grade in the database
SELECT MAX(grade) AS highest_grade
FROM grades;

-- Get the minimum grade in the database
SELECT MIN(grade) AS lowest_grade
FROM grades;

-- Sum of all grades (not very useful but good for learning)
SELECT SUM(grade) AS total_grades
FROM grades;


-- =========================================================
-- GROUP BY WITH MULTIPLE COLUMNS
-- =========================================================

-- Average grade per student
SELECT student_id, AVG(grade) AS avg_student_grade
FROM grades
GROUP BY student_id;

-- Average grade per subject
SELECT subject_id, AVG(grade) AS avg_subject_grade
FROM grades
GROUP BY subject_id;

-- Average grade per student and subject
SELECT student_id, subject_id, AVG(grade) AS avg_grade
FROM grades
GROUP BY student_id, subject_id;


-- =========================================================
-- HAVING (FILTER GROUPED DATA)
-- =========================================================

-- Show students with average grade >= 10 (passed)
SELECT student_id, AVG(grade) AS avg_grade
FROM grades
GROUP BY student_id
HAVING AVG(grade) >= 10;

-- Subjects with more than 5 students
SELECT subject_id, COUNT(*) AS total_students
FROM grades
GROUP BY subject_id
HAVING COUNT(*) > 5;


-- =========================================================
-- REAL-WORLD EXAMPLES
-- =========================================================

-- Best student (highest average grade)
SELECT student_id, AVG(grade) AS avg_grade
FROM grades
GROUP BY student_id
ORDER BY avg_grade DESC
LIMIT 1;

-- Worst student (lowest average grade)
SELECT student_id, AVG(grade) AS avg_grade
FROM grades
GROUP BY student_id
ORDER BY avg_grade ASC
LIMIT 1;

-- Number of students per class
SELECT class_id, COUNT(*) AS total_students
FROM students
GROUP BY class_id
ORDER BY total_students DESC;
