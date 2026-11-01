-- Q03: Revoke only INSERT from alice; SELECT remains granted.
REVOKE INSERT ON company_db.employees FROM 'alice'@'localhost';
