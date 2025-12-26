/*
===========================================================
 File: users_roles.sql
 Description: Examples of PostgreSQL users, roles, and permissions
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected as a superuser
-- \c pg_syntax_master;



-- =========================================================
-- 1) CREATE ROLES
-- Roles can own objects and have privileges
-- =========================================================

-- Create a read-only role
CREATE ROLE read_only;

-- Create a read-write role
CREATE ROLE read_write;



-- =========================================================
-- 2) CREATE USERS AND ASSIGN ROLES
-- =========================================================

-- Create a user and assign read-only role
CREATE USER alice WITH PASSWORD 'alice123';
GRANT read_only TO alice;

-- Create a user and assign read-write role
CREATE USER bob WITH PASSWORD 'bob123';
GRANT read_write TO bob;



-- =========================================================
-- 3) GRANT PRIVILEGES
-- Control what roles can do on specific tables
-- =========================================================

-- Grant SELECT only to read_only role on students table
GRANT SELECT ON students TO read_only;

-- Grant SELECT, INSERT, UPDATE, DELETE to read_write role
GRANT SELECT, INSERT, UPDATE, DELETE ON students TO read_write;

-- Grant all privileges on a specific table
-- GRANT ALL PRIVILEGES ON grades TO read_write;



-- =========================================================
-- 4) REVOKE PRIVILEGES
-- Remove permissions if needed
-- =========================================================

-- Revoke INSERT from read_write role on students
REVOKE INSERT ON students FROM read_write;



-- =========================================================
-- 5) SET ROLE (SWITCH ROLES INSIDE SESSION)
-- =========================================================

-- Switch to role read_only
-- SET ROLE read_only;

-- Reset to original role
-- RESET ROLE;



-- =========================================================
-- 6) NOTES
-- =========================================================

-- Roles are like groups of privileges
-- Users can have multiple roles
-- Privileges control access to:
--  - Tables (SELECT, INSERT, UPDATE, DELETE)
--  - Schemas (USAGE, CREATE)
--  - Databases (CONNECT)
-- Always follow principle of least privilege in backend systems
