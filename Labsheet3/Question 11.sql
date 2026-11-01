-- Q11: Add DELETE permission on orders to dev_user.
-- Existing SELECT, INSERT and UPDATE permissions are not removed.
GRANT DELETE ON company_db.orders TO 'dev_user'@'localhost';
