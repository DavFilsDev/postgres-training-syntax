/*
===========================================================
 File: locks_and_isolation.sql
 Description: Examples of locks and transaction isolation levels in PostgreSQL
 AUTHOR: Fanampinirina Miharisoa David Fils RATIANDRAIBE
===========================================================
*/

-- Make sure you are connected to the database
-- \c pg_syntax_master;



-- =========================================================
-- 1) EXPLICIT LOCKS USING LOCK TABLE
-- Prevent other transactions from modifying a table
-- =========================================================

-- Lock students table in ACCESS EXCLUSIVE mode (most strict)
LOCK TABLE students IN ACCESS EXCLUSIVE MODE;

-- After this lock, no other transaction can read/write until we commit
-- COMMIT; -- unlock the table



-- =========================================================
-- 2) ROW-LEVEL LOCKING
-- Lock only specific rows to prevent conflicts
-- =========================================================

-- Lock a single student row before updating
BEGIN;

SELECT * FROM students
WHERE id = 1
FOR UPDATE;  -- locks the row

-- Now safe to update
UPDATE students SET name = 'Updated Name' WHERE id = 1;

COMMIT;



-- =========================================================
-- 3) TRANSACTION ISOLATION LEVELS
-- Control how transactions see data
-- =========================================================

-- 3a) READ UNCOMMITTED (allows dirty reads, rarely used in Postgres)
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
-- SELECT statements may see uncommitted changes
COMMIT;

-- 3b) READ COMMITTED (default)
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Each SELECT sees only committed changes so far
COMMIT;

-- 3c) REPEATABLE READ
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- All SELECTs in this transaction see the same snapshot
COMMIT;

-- 3d) SERIALIZABLE (most strict, like transactions run sequentially)
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Prevents phantom reads and ensures full consistency
COMMIT;



-- =========================================================
-- 4) PRACTICAL EXAMPLE: PREVENT LOST UPDATE
-- =========================================================

-- Transaction 1
BEGIN;
SELECT balance FROM accounts WHERE id = 1 FOR UPDATE;
-- read current balance, update
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
-- COMMIT;

-- Transaction 2 running concurrently will wait until Transaction 1 commits



-- =========================================================
-- Notes:
-- LOCK TABLE = table-level lock (prevent any conflicts)
-- FOR UPDATE = row-level lock (prevent concurrent updates)
-- Isolation levels control visibility of data across concurrent transactions
-- PostgreSQL default = READ COMMITTED
-- SERIALIZABLE = safest, prevents anomalies
-- Always use locks & isolation for critical backend operations (banking, inventory)
-- =========================================================
