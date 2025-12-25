/*
===========================================================
 File: relationships.sql
 Description: Examples of database relationships in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) ONE-TO-ONE RELATIONSHIP
-- Each row in table A is linked to one row in table B
-- =========================================================

-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)
);

-- User profiles table (one-to-one)
CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE REFERENCES users(id), -- each user has one profile
    bio TEXT,
    avatar_url TEXT
);



-- =========================================================
-- 2) ONE-TO-MANY RELATIONSHIP
-- One row in table A links to multiple rows in table B
-- =========================================================

-- Students table
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Grades table (one student can have many grades)
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id), -- links to student
    subject VARCHAR(50),
    grade FLOAT
);



-- =========================================================
-- 3) MANY-TO-MANY RELATIONSHIP
-- Many rows in table A link to many rows in table B
-- Requires a junction table
-- =========================================================

-- Courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100)
);

-- Enrollment table (junction table)
CREATE TABLE enrollments (
    student_id INT REFERENCES students(id),
    course_id INT REFERENCES courses(id),
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id) -- composite PK
);



-- =========================================================
-- 4) EXAMPLES OF INSERTS
-- =========================================================

-- Insert users and profiles
INSERT INTO users (username, email) VALUES ('alice', 'alice@email.com');
INSERT INTO user_profiles (user_id, bio, avatar_url) VALUES (1, 'I love databases', 'avatar1.png');

-- Insert students and grades
INSERT INTO students (name) VALUES ('David');
INSERT INTO grades (student_id, subject, grade) VALUES (1, 'Math', 15);

-- Insert courses and enrollments
INSERT INTO courses (course_name) VALUES ('Database Systems');
INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES (1, 1, '2026-02-17');



-- =========================================================
-- Notes:
-- ONE-TO-ONE: user -> profile (unique FK)
-- ONE-TO-MANY: student -> grades (multiple grades per student)
-- MANY-TO-MANY: students <-> courses (junction table)
-- PRIMARY KEY ensures uniqueness
-- FOREIGN KEY ensures referential integrity
-- =========================================================
