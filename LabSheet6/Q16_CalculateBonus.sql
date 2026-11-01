-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q16. Calculate Bonus

DROP FUNCTION IF EXISTS CalculateBonus;

DELIMITER //
CREATE FUNCTION CalculateBonus(p_Marks DECIMAL(5,2))
RETURNS INT
DETERMINISTIC
BEGIN
    IF p_Marks >= 90 THEN
        RETURN 1000;
    ELSEIF p_Marks >= 75 THEN
        RETURN 500;
    ELSE
        RETURN 200;
    END IF;
END //
DELIMITER ;

-- Test
SELECT StudentName, Marks, CalculateBonus(Marks) AS Bonus FROM Student;
