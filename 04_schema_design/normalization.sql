/*
===========================================================
 File: normalization.sql
 Description: Examples of database normalization (1NF, 2NF, 3NF)
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- WHAT IS NORMALIZATION?
-- Normalization = organizing tables to avoid:
--  - Data duplication
--  - Inconsistency
--  - Update problems
-- =========================================================


-- =========================================================
-- 1NF (FIRST NORMAL FORM)
-- Rules:
-- 1. Each column must contain atomic (single) values
-- 2. No repeating groups or arrays
-- =========================================================

-- BAD TABLE (not normalized)
-- student_subjects column stores multiple values in one field
CREATE TABLE students_bad_1nf (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    student_subjects TEXT  -- Example: "Math, Physics, Biology"
);

-- GOOD TABLE (1NF normalized)
-- Each subject is stored in a separate row
CREATE TABLE students_1nf (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE student_subjects (
    student_id INT REFERENCES students_1nf(id),
    subject VARCHAR(100)
);


-- =========================================================
-- 2NF (SECOND NORMAL FORM)
-- Rules:
-- 1. Table must be in 1NF
-- 2. No partial dependency (columns must depend on full primary key)
-- =========================================================

-- BAD TABLE (subject_name depends only on subject_id, not student_id)
CREATE TABLE grades_bad_2nf (
    student_id INT,
    subject_id INT,
    subject_name VARCHAR(100),
    grade FLOAT,
    PRIMARY KEY (student_id, subject_id)
);

-- GOOD TABLE (2NF normalized)
CREATE TABLE subjects_2nf (
    id SERIAL PRIMARY KEY,
    subject_name VARCHAR(100)
);

CREATE TABLE grades_2nf (
    student_id INT,
    subject_id INT REFERENCES subjects_2nf(id),
    grade FLOAT,
    PRIMARY KEY (student_id, subject_id)
);


-- =========================================================
-- 3NF (THIRD NORMAL FORM)
-- Rules:
-- 1. Table must be in 2NF
-- 2. No transitive dependency (non-key columns depend only on primary key)
-- =========================================================

-- BAD TABLE (class_name depends on class_id, not student_id)
CREATE TABLE students_bad_3nf (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    class_id INT,
    class_name VARCHAR(100) -- redundant data
);

-- GOOD TABLE (3NF normalized)
CREATE TABLE classes_3nf (
    id SERIAL PRIMARY KEY,
    class_name VARCHAR(100)
);

CREATE TABLE students_3nf (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    class_id INT REFERENCES classes_3nf(id)
);


-- =========================================================
-- SUMMARY COMMENTS
-- =========================================================

-- 1NF: No multiple values in one column
-- 2NF: No partial dependency on composite keys
-- 3NF: No transitive dependency between non-key columns

-- Normalization makes databases:
-- - Faster to update
-- - More consistent
-- - Easier to maintain
