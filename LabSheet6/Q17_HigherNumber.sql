-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q17. Find Higher Number

DROP FUNCTION IF EXISTS HigherNumber;

DELIMITER //
CREATE FUNCTION HigherNumber(a INT, b INT)
RETURNS INT
DETERMINISTIC
BEGIN
    IF a > b THEN
        RETURN a;
    ELSE
        RETURN b;
    END IF;
END //
DELIMITER ;

-- Test
SELECT HigherNumber(10, 25) AS Higher;
