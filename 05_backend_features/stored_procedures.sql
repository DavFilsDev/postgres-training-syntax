/*
===========================================================
 File: stored_procedures.sql
 Description: Examples of PostgreSQL stored procedures
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) SIMPLE STORED PROCEDURE
-- No input, just performs an action
-- =========================================================

CREATE OR REPLACE PROCEDURE greet()
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Hello from PostgreSQL stored procedure!';
END;
$$;

-- Call the procedure
CALL greet();



-- =========================================================
-- 2) PROCEDURE WITH PARAMETERS
-- Input parameters to customize behavior
-- =========================================================

CREATE OR REPLACE PROCEDURE add_student(
    student_name VARCHAR,
    student_class INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO students(name, class_id)
    VALUES (student_name, student_class);
    RAISE NOTICE 'Student % added successfully', student_name;
END;
$$;

-- Call the procedure
CALL add_student('David', 1);



-- =========================================================
-- 3) PROCEDURE WITH MULTIPLE ACTIONS / TRANSACTION
-- =========================================================

CREATE OR REPLACE PROCEDURE transfer_grade(
    from_student INT,
    to_student INT,
    subject VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    grade_value NUMERIC;
BEGIN
    -- Get the grade of the first student
    SELECT grade INTO grade_value
    FROM grades
    WHERE student_id = from_student AND subject = subject;

    -- Remove grade from first student
    DELETE FROM grades
    WHERE student_id = from_student AND subject = subject;

    -- Add grade to second student
    INSERT INTO grades(student_id, subject, grade)
    VALUES (to_student, subject, grade_value);

    RAISE NOTICE 'Transferred grade % from student % to student %', grade_value, from_student, to_student;
END;
$$;

-- Call the procedure (example)
-- CALL transfer_grade(1, 2, 'Math');



-- =========================================================
-- 4) NOTES
-- =========================================================

-- Stored procedures:
-- - Encapsulate reusable backend logic
-- - Can have parameters (IN, OUT, INOUT)
-- - Can perform multiple SQL statements / transactions
-- - Use RAISE NOTICE for debug messages
-- - Called with CALL procedure_name(...)
-- - Prefer procedures for actions (modifies data), use FUNCTIONS for returning values
