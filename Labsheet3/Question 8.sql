-- Q08: Grant all privileges on all databases to the remote admin account.
-- Run this as a MySQL account that has authority to grant global privileges.
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'%';
