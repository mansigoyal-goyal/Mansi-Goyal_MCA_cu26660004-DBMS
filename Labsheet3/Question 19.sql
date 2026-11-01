-- Q19: Update order 5002 to Shipped only if its amount is at least 500.
-- The supplied order amount is 450.00, so this transaction rolls back.
USE company_db;
DELIMITER //

CREATE PROCEDURE q19_order_status_workflow()
BEGIN
    DECLARE v_amount DECIMAL(10,2);

    START TRANSACTION;

    SELECT total_amount
      INTO v_amount
      FROM orders
     WHERE order_id = 5002
     FOR UPDATE;

    UPDATE orders
       SET status = 'Shipped'
     WHERE order_id = 5002;

    IF v_amount < 500.00 THEN
        ROLLBACK;
    ELSE
        COMMIT;
    END IF;
END //

DELIMITER ;

CALL q19_order_status_workflow();
DROP PROCEDURE q19_order_status_workflow;

-- With the given amount (450.00), status remains Pending.
