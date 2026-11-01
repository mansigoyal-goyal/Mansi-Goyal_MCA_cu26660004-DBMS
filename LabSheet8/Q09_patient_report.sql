-- Database Technologies Lab Sheet 8 (MCA105P)
-- Q9. patient_report() using calculate_bmi() and age_category()
-- Run 00_setup.sql once first (creates the database and tables).
-- The Patients table has no height column, so the report assumes a height of 1.70 m for everyone.
-- Change v_height inside the procedure to use a different value.

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

DROP PROCEDURE IF EXISTS patient_report;

DELIMITER //
CREATE PROCEDURE patient_report()
BEGIN
    DECLARE v_height DECIMAL(4,2) DEFAULT 1.70;   -- assumed height in metres

    SELECT PatientID,
           PatientName,
           Age,
           calculate_bmi(WeightKg, v_height) AS BMI,
           age_category(Age) AS AgeCategory
    FROM Patients;
END //
DELIMITER ;

-- Test
CALL patient_report();
