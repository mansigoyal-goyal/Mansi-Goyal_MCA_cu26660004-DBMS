-- Database Technologies Lab Sheet 7 (MCA105P)
-- Part E - Trigger Question 2: AFTER UPDATE trigger recording OLD and NEW fee
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
CREATE TRIGGER trg_doctors_after_update_fee
AFTER UPDATE ON Doctors
FOR EACH ROW
BEGIN
    -- <=> is a NULL-safe comparison; only log when the fee really changed
    IF NOT (OLD.ConsultationFee <=> NEW.ConsultationFee) THEN
        INSERT INTO Doctor_Audit (DoctorID, ActionType, OldFee, NewFee)
        VALUES (OLD.DoctorID, 'FEE UPDATE', OLD.ConsultationFee, NEW.ConsultationFee);
    END IF;
END //
DELIMITER ;

-- Test
UPDATE Doctors SET ConsultationFee = 1400 WHERE DoctorID = 201;
SELECT * FROM Doctor_Audit;   -- OldFee 1200.00, NewFee 1400.00

-- A change to another column does not create an audit row
UPDATE Doctors SET Status = 'On Leave' WHERE DoctorID = 202;
SELECT * FROM Doctor_Audit;
