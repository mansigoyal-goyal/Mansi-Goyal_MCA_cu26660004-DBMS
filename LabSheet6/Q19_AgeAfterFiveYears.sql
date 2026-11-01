-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q19. Calculate Age After Five Years

DROP FUNCTION IF EXISTS AgeAfterFiveYears;

DELIMITER //
CREATE FUNCTION AgeAfterFiveYears(p_Age INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN p_Age + 5;
END //
DELIMITER ;

-- Test
SELECT StudentName, Age, AgeAfterFiveYears(Age) AS AgeAfter5Years FROM Student;
