-- Q20: Create reporter_role, grant read access, and assign it to analyst.
CREATE ROLE IF NOT EXISTS 'reporter_role';

GRANT SELECT ON company_db.* TO 'reporter_role';
GRANT 'reporter_role' TO 'analyst'@'localhost';

-- Make the role active by default when analyst logs in.
SET DEFAULT ROLE 'reporter_role' TO 'analyst'@'localhost';
