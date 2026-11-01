-- Q26: Create a role hierarchy and assign admin_role to super_dev.
CREATE ROLE IF NOT EXISTS 'read_role', 'write_role', 'admin_role';

-- Define permissions for the lower-level roles.
GRANT SELECT ON company_db.* TO 'read_role';
GRANT INSERT, UPDATE, DELETE ON company_db.* TO 'write_role';

-- admin_role inherits both lower-level roles.
GRANT 'read_role', 'write_role' TO 'admin_role';

-- Create the user and assign the top-level role.
CREATE USER IF NOT EXISTS 'super_dev'@'localhost'
IDENTIFIED BY 'ChangeThis_StrongPassword!';

GRANT 'admin_role' TO 'super_dev'@'localhost';
SET DEFAULT ROLE 'admin_role' TO 'super_dev'@'localhost';
