-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q5. patient_by_gender(IN p_gender)
-- Run 00_setup.sql once first (creates the database and tables).

USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS patient_by_gender;

DELIMITER //
CREATE PROCEDURE patient_by_gender(IN p_gender VARCHAR(10))
BEGIN
    SELECT * FROM Patients WHERE Gender = p_gender;
END //
DELIMITER ;

-- Test
CALL patient_by_gender('F');
CALL patient_by_gender('M');
