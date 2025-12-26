/*
===========================================================
 File: triggers.sql
 Description: Examples of PostgreSQL triggers
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) BASIC TRIGGER
-- Automatically perform action after insert
-- =========================================================

-- Example table
CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Another table to track students
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

-- Trigger function (PL/pgSQL)
CREATE OR REPLACE FUNCTION log_student_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs(message)
    VALUES ('New student inserted: ' || NEW.name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: fire after insert on students table
CREATE TRIGGER after_student_insert
AFTER INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION log_student_insert();

-- Test the trigger
INSERT INTO students(name) VALUES ('Alice'); 
-- Automatically creates a log entry in logs table



-- =========================================================
-- 2) BEFORE INSERT TRIGGER
-- Modify data before insert
-- =========================================================

-- Trigger function: capitalize student name before insert
CREATE OR REPLACE FUNCTION capitalize_name()
RETURNS TRIGGER AS $$
BEGIN
    NEW.name := INITCAP(NEW.name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: fire before insert
CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION capitalize_name();

-- Test
INSERT INTO students(name) VALUES ('bob smith'); 
-- Name automatically becomes 'Bob Smith'



-- =========================================================
-- 3) AFTER UPDATE TRIGGER
-- Track changes to a column
-- =========================================================

-- Trigger function: log name updates
CREATE OR REPLACE FUNCTION log_name_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs(message)
    VALUES ('Student name changed from ' || OLD.name || ' to ' || NEW.name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger: fire after update
CREATE TRIGGER after_student_update
AFTER UPDATE OF name ON students
FOR EACH ROW
EXECUTE FUNCTION log_name_update();

-- Test
UPDATE students SET name = 'Robert Smith' WHERE name = 'Bob Smith'; 
-- Log entry created automatically



-- =========================================================
-- 4) NOTES
-- =========================================================

-- Triggers = automatic actions on table events (INSERT, UPDATE, DELETE)
-- BEFORE triggers = modify data before action
-- AFTER triggers = perform actions after action
-- FOR EACH ROW = trigger runs for every row affected
-- Trigger functions are written in PL/pgSQL
-- Useful for audit logs, validations, cascading changes, notifications
