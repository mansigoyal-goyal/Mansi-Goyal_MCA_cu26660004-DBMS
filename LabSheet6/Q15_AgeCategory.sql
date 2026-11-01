-- Database Technologies Lab Sheet 6 (MCA105P)
-- Run 00_setup.sql first.
USE CollegeDB;

-- Q15. Find Age Category

DROP FUNCTION IF EXISTS AgeCategory;

DELIMITER //
CREATE FUNCTION AgeCategory(p_Age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF p_Age >= 18 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Minor';
    END IF;
END //
DELIMITER ;

-- Test
SELECT AgeCategory(20) AS Category;
SELECT AgeCategory(15) AS Category;
