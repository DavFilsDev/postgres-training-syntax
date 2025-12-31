/*
===========================================================
 File: 07_security.sql
 Description: Roles and privileges for student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Create roles
-- =========================================================
CREATE ROLE admin_role;
CREATE ROLE teacher_role;
CREATE ROLE student_role;

-- =========================================================
-- Grant privileges to admin
-- =========================================================
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_role;

-- =========================================================
-- Teacher can read students and insert grades
-- =========================================================
GRANT SELECT ON students, subjects, classes TO teacher_role;
GRANT INSERT, UPDATE ON grades TO teacher_role;

-- =========================================================
-- Student can only read their data (simplified)
-- =========================================================
GRANT SELECT ON students, grades, subjects TO student_role;

-- =========================================================
-- Example users
-- =========================================================
CREATE USER admin_user WITH PASSWORD 'admin123';
CREATE USER teacher_user WITH PASSWORD 'teacher123';
CREATE USER student_user WITH PASSWORD 'student123';

-- Assign roles to users
GRANT admin_role TO admin_user;
GRANT teacher_role TO teacher_user;
GRANT student_role TO student_user;
