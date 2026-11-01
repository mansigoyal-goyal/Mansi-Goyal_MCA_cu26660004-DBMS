-- Q13: Revoke UPDATE but retain SELECT for hr_assistant.
REVOKE UPDATE ON company_db.employees FROM 'hr_assistant'@'localhost';
