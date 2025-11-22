/*
==========================================================
 FILE: create_table.sql
 PURPOSE: Learn how to create tables in PostgreSQL
 AUTHOR: David RATIANDRAIBE
==========================================================
*/

-- Make sure you are connected to the training database
-- \c pg_syntax_master;



-- ========================================================
-- 1) USERS TABLE
-- This table stores all users of the system (students, admins, teachers)
-- ========================================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,              -- Unique user ID (auto increment)
    username VARCHAR(50) NOT NULL,       -- Username (cannot be NULL)
    email VARCHAR(100) UNIQUE NOT NULL,  -- Email must be unique
    password TEXT NOT NULL,              -- Hashed password
    created_at TIMESTAMP DEFAULT NOW()  -- Date when user is created
);



-- ========================================================
-- 2) ROLES TABLE
-- This table defines roles in the system (student, admin, teacher)
-- ========================================================
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,               -- Unique role ID
    role_name VARCHAR(30) UNIQUE NOT NULL -- Role name must be unique
);



-- ========================================================
-- 3) USER_ROLES TABLE (Many-to-Many relationship)
-- A user can have many roles, and a role can belong to many users
-- ========================================================
CREATE TABLE user_roles (
    user_id INT REFERENCES users(id) ON DELETE CASCADE, -- Link to users
    role_id INT REFERENCES roles(id) ON DELETE CASCADE,  -- Link to roles
    PRIMARY KEY (user_id, role_id) -- Composite primary key
);



-- ========================================================
-- 4) STUDENTS TABLE
-- Stores student-specific information
-- ========================================================
CREATE TABLE students (
    id SERIAL PRIMARY KEY,                 -- Student ID
    user_id INT UNIQUE REFERENCES users(id), -- Link student to a user account
    first_name VARCHAR(50) NOT NULL,        -- Student first name
    last_name VARCHAR(50) NOT NULL,         -- Student last name
    birth_date DATE,                        -- Date of birth
    enrollment_date DATE DEFAULT CURRENT_DATE -- Date of enrollment
);



-- ========================================================
-- 5) COURSES TABLE
-- Stores university courses
-- ========================================================
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,                -- Course ID
    course_name VARCHAR(100) NOT NULL,    -- Course name
    credits INT CHECK (credits > 0),      -- Credits must be positive
    created_at TIMESTAMP DEFAULT NOW()   -- Creation date
);



-- ========================================================
-- 6) ENROLLMENTS TABLE
-- Links students to courses (Many-to-Many)
-- ========================================================
CREATE TABLE enrollments (
    student_id INT REFERENCES students(id) ON DELETE CASCADE, -- Student link
    course_id INT REFERENCES courses(id) ON DELETE CASCADE,    -- Course link
    enrolled_at TIMESTAMP DEFAULT NOW(),                       -- Enrollment date
    PRIMARY KEY (student_id, course_id)                         -- Composite PK
);



-- ========================================================
-- Notes:
-- SERIAL = auto increment integer
-- PRIMARY KEY = unique identifier
-- FOREIGN KEY = link between tables
-- ON DELETE CASCADE = delete related rows automatically
-- UNIQUE = value must be unique
-- NOT NULL = value cannot be empty
-- CHECK = condition validation
-- ========================================================
