-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q11. Add Two Numbers

DROP FUNCTION IF EXISTS AddTwoNumbers;

DELIMITER //
CREATE FUNCTION AddTwoNumbers(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN a + b;
END //
DELIMITER ;

-- Test
SELECT AddTwoNumbers(10, 20) AS Sum;
