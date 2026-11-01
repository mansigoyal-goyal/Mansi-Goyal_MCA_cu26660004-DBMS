-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q6. patients_above_age(IN p_age)
-- Run 00_setup.sql once first (creates the database and tables).

USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patients_above_age;

DELIMITER //
CREATE PROCEDURE patients_above_age(IN p_age INT)
BEGIN
    SELECT * FROM Patients WHERE Age > p_age;
END //
DELIMITER ;

-- Test with two different ages
CALL patients_above_age(30);
CALL patients_above_age(45);
