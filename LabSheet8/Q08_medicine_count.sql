-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q8. medicine_count(OUT p_count)
-- Run 00_setup.sql once first (creates the database and tables).

USE Hospital_Functions_Lab;

DROP PROCEDURE IF EXISTS medicine_count;

DELIMITER //
CREATE PROCEDURE medicine_count(OUT p_count INT)
BEGIN
    SELECT COUNT(*) INTO p_count FROM Medicines;
END //
DELIMITER ;

-- Test with a session variable
CALL medicine_count(@total_medicines);
SELECT @total_medicines AS TotalMedicines;   -- 5
