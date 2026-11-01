-- Q18: Remove delegation rights without removing SELECT or INSERT.
REVOKE GRANT OPTION ON company_db.* FROM 'team_lead'@'localhost';

-- The base SELECT and INSERT privileges remain in place.
