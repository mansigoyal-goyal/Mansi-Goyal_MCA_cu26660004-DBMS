-- Q25: Cancel order 5002 and refund its 450.00 amount to department 20.
-- IMPORTANT: The lab's pre-created manager account has UPDATE on orders only,
-- not departments. An administrator must first run this one-time grant:
-- GRANT UPDATE ON company_db.departments TO 'manager'@'localhost';
USE company_db;
DELIMITER //

CREATE PROCEDURE q25_cancel_and_refund()
BEGIN
    DECLARE v_amount DECIMAL(10,2);
    DECLARE v_status VARCHAR(20);

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT total_amount, status
      INTO v_amount, v_status
      FROM orders
     WHERE order_id = 5002
     FOR UPDATE;

    IF v_status = 'Pending' THEN
        UPDATE orders
           SET status = 'Cancelled'
         WHERE order_id = 5002;

        UPDATE departments
           SET budget = budget + v_amount
         WHERE dept_id = 20;

        COMMIT;
    ELSE
        ROLLBACK;
    END IF;
END //

DELIMITER ;

CALL q25_cancel_and_refund();
DROP PROCEDURE q25_cancel_and_refund;
