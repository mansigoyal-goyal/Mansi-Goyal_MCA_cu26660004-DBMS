-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q2. age_category(age) applied to every patient
-- Run 00_setup.sql once first (creates the database and tables).

USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS age_category;

DELIMITER //
CREATE FUNCTION age_category(p_age INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    -- Rules: Child = below 18, Adult = 18 to 59, Senior = 60 and above
    IF p_age < 18 THEN
        RETURN 'Child';
    ELSEIF p_age < 60 THEN
        RETURN 'Adult';
    ELSE
        RETURN 'Senior';
    END IF;
END //
DELIMITER ;

-- Test
SELECT PatientID, PatientName, Age, age_category(Age) AS AgeCategory
FROM Patients;
