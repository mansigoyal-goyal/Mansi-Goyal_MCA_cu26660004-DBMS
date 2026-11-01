-- ======================================================================
-- Q54
-- Database Technologies Practice Sheet (MCA105P) - DML, constraints and DDL practice
-- ======================================================================
-- QUESTION:
-- 54. Insert at least three books, three members and three loans.
--
-- NOTE: Run Q51, Q52 and Q53 first. Running it twice gives 'Duplicate entry' errors (re-run Q51-Q53 to reset).
-- ======================================================================

USE sql_lab;

-- Books and Members are inserted before Loans because of the foreign keys.

INSERT INTO Books VALUES
(1,'Database System Concepts','Korth','9780073523323','Database'),
(2,'Operating System Concepts','Silberschatz','9781119456339','OS'),
(3,'Python Crash Course','Eric Matthes','9781718502703','Programming');

INSERT INTO Members VALUES
(101,'Amit Sharma','amit.lib@example.com','9876500001'),
(102,'Priya Singh','priya.lib@example.com','9876500002'),
(103,'Rahul Verma','rahul.lib@example.com','9876500003');

INSERT INTO Loans VALUES
(1,1,101,'2026-09-01',NULL),
(2,2,102,'2026-09-02','2026-09-06'),
(3,3,103,'2026-09-04',NULL);
