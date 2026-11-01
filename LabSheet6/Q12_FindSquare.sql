-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q12. Find Square

DROP FUNCTION IF EXISTS FindSquare;

DELIMITER //
CREATE FUNCTION FindSquare(n INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN n * n;
END //
DELIMITER ;

-- Test
SELECT FindSquare(5) AS Square;
