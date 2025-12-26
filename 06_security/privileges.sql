/*
===========================================================
 File: privileges.sql
 Description: Examples of PostgreSQL privileges and grants
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected as a superuser
-- \c pg_syntax_master;



-- =========================================================
-- 1) GRANT PRIVILEGES ON TABLES
-- =========================================================

-- Grant SELECT only (read access) to read_only role on students table
GRANT SELECT ON students TO read_only;

-- Grant full access (read/write/delete) to read_write role
GRANT SELECT, INSERT, UPDATE, DELETE ON students TO read_write;



-- =========================================================
-- 2) GRANT PRIVILEGES ON SCHEMA
-- =========================================================

-- Grant usage and create privileges on schema 'public'
GRANT USAGE, CREATE ON SCHEMA public TO read_write;

-- USAGE: allows access to objects in schema
-- CREATE: allows creating new objects in schema



-- =========================================================
-- 3) GRANT PRIVILEGES ON DATABASE
-- =========================================================

-- Allow read_write role to connect to database
GRANT CONNECT ON DATABASE pg_syntax_master TO read_write;



-- =========================================================
-- 4) REVOKE PRIVILEGES
-- =========================================================

-- Revoke INSERT from read_write role on students
REVOKE INSERT ON students FROM read_write;

-- Revoke all privileges on schema public from read_write
-- REVOKE ALL ON SCHEMA public FROM read_write;



-- =========================================================
-- 5) GRANT WITH GRANT OPTION
-- =========================================================

-- Allow read_write role to grant privileges to others
GRANT SELECT, INSERT ON students TO read_write WITH GRANT OPTION;

-- Now read_write can give SELECT/INSERT on students to other users



-- =========================================================
-- 6) NOTES
-- =========================================================

-- Privileges control access to:
-- - Tables (SELECT, INSERT, UPDATE, DELETE)
-- - Schemas (USAGE, CREATE)
-- - Databases (CONNECT)
-- WITH GRANT OPTION allows role to pass privileges to others
-- Always follow least privilege principle in production backend
