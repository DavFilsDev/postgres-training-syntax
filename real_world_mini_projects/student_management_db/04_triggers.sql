/*
===========================================================
 File: 04_triggers.sql
 Description: Triggers for automatic logging in student management DB
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- =========================================================
-- Table to store logs
-- =========================================================
CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    message TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- =========================================================
-- Trigger function: log grade insert
-- =========================================================
CREATE OR REPLACE FUNCTION log_grade_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO logs(message)
    VALUES ('New grade inserted for student_id: ' || NEW.student_id || ', subject_id: ' || NEW.subject_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- =========================================================
-- Trigger: fire after insert on grades table
-- =========================================================
CREATE TRIGGER after_grade_insert
AFTER INSERT ON grades
FOR EACH ROW
EXECUTE FUNCTION log_grade_insert();
