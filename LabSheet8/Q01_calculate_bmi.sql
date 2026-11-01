-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q1. calculate_bmi(weight_kg, height_m)
-- Run 00_setup.sql once first (creates the database and tables).

USE Hospital_Functions_Lab;

DROP FUNCTION IF EXISTS calculate_bmi;

DELIMITER //
CREATE FUNCTION calculate_bmi(p_weight_kg DECIMAL(5,2), p_height_m DECIMAL(4,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    -- BMI = weight (kg) / height (m) squared
    IF p_height_m IS NULL OR p_height_m <= 0 THEN
        RETURN NULL;
    END IF;

    RETURN ROUND(p_weight_kg / (p_height_m * p_height_m), 2);
END //
DELIMITER ;

-- Test
SELECT calculate_bmi(70, 1.75) AS BMI;     -- 22.86
SELECT calculate_bmi(55.5, 1.60) AS BMI;   -- 21.68
SELECT calculate_bmi(85, 1.70) AS BMI;     -- 29.41
