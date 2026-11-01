-- Q29: Insert orders 5008 and 5009 with savepoints.
-- Business-rule example used here: total_amount must be greater than zero.
-- If order 5009 fails that rule, roll back to sp_5008 (keep order 5008).
USE company_db;
DELIMITER //

CREATE PROCEDURE q29_batch_insert()
BEGIN
    DECLARE v_order5009_amount DECIMAL(10,2) DEFAULT 0.00;

    START TRANSACTION;

    INSERT INTO orders (order_id, customer_name, order_date, total_amount, status)
    VALUES (5008, 'New Customer 5008', CURRENT_DATE(), 700.00, 'Pending');

    SAVEPOINT sp_5008;

    INSERT INTO orders (order_id, customer_name, order_date, total_amount, status)
    VALUES (5009, 'New Customer 5009', CURRENT_DATE(), v_order5009_amount, 'Pending');

    SAVEPOINT sp_5009;

    IF v_order5009_amount <= 0 THEN
        ROLLBACK TO SAVEPOINT sp_5008;
    END IF;

    COMMIT;
END //

DELIMITER ;

CALL q29_batch_insert();
DROP PROCEDURE q29_batch_insert;

-- Here order 5009 has amount 0, so it fails the example business rule.
-- Rolling back to sp_5008 also removes the order 5009 insert, but preserves 5008.
