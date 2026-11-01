-- Q10: Revoke all privileges and grant options on company_db from intern_user.
REVOKE ALL PRIVILEGES, GRANT OPTION ON company_db.* FROM 'intern_user'@'localhost';
