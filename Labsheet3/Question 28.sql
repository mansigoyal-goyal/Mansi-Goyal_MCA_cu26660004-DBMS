-- Q28: Create a remote account that must use encrypted TLS/SSL connections.
CREATE USER IF NOT EXISTS 'cloud_user'@'%'
IDENTIFIED BY 'ChangeThis_StrongPassword!'
REQUIRE SSL;

GRANT SELECT, INSERT ON company_db.* TO 'cloud_user'@'%';

SHOW GRANTS FOR 'cloud_user'@'%';
