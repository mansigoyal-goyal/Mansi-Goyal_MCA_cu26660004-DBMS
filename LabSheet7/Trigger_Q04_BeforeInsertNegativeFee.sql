-- Database Technologies Lab Sheet 7 (MCA105P)
-- Part E - Trigger Question 4: BEFORE INSERT trigger rejecting a negative ConsultationFee
-- Run 00_setup.sql once first (creates the database and tables).
-- Re-running this file resets the Doctors data and audit tables.

USE Hospital_Cursor_Trigger_Lab;

-- Reset so this file can be run on its own, any number of times
DROP TRIGGER IF EXISTS trg_doctors_after_insert;
DROP TRIGGER IF EXISTS trg_doctors_after_update_fee;
DROP TRIGGER IF EXISTS trg_doctors_before_insert_upper;
DROP TRIGGER IF EXISTS trg_doctors_before_insert_fee_check;
DROP TRIGGER IF EXISTS trg_doctors_after_delete;
DROP TRIGGER IF EXISTS trg_doctors_after_update_feelog;
DROP TRIGGER IF EXISTS trg_doctors_before_update_fee_check;
DROP TRIGGER IF EXISTS trg_doctors_before_update_status;
DROP TRIGGER IF EXISTS trg_doctors_after_update_dept;
DROP TRIGGER IF EXISTS trg_doctors_before_update_fee_jump;
DELETE FROM Doctors;
INSERT INTO Doctors VALUES
(201,'Dr. Anil','Cardiology',1200,'Active'),
(202,'Dr. Beena','Pediatrics',900,'Active'),
(203,'Dr. Chirag','Neurology',1500,'Active'),
(204,'Dr. Divya','Dermatology',1000,'Active'),
(205,'Dr. Eshan','Cardiology',1300,'Active'),
(206,'Dr. Farah','Pediatrics',850,'Active');
TRUNCATE TABLE Doctor_Audit;
TRUNCATE TABLE Fee_Log;

DELIMITER //
CREATE TRIGGER trg_doctors_before_insert_fee_check
BEFORE INSERT ON Doctors
FOR EACH ROW
BEGIN
    IF NEW.ConsultationFee < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: ConsultationFee cannot be negative';
    END IF;
END //
DELIMITER ;

-- Test
-- 1) Valid insert: works
INSERT INTO Doctors VALUES (207, 'Dr. Gita', 'Orthopedics', 1100, 'Active');
SELECT * FROM Doctors;

-- 2) Invalid insert: fails with ERROR 1644 (45000) 'ConsultationFee cannot be negative'
--    (kept last, because most clients stop a script at the first error)
INSERT INTO Doctors VALUES (208, 'Dr. Hari', 'Orthopedics', -500, 'Active');
SELECT * FROM Doctors;   -- 208 was not inserted
