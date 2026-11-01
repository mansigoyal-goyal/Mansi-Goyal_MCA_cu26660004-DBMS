-- ============================================================
-- Q42 | Section C (Hard) | Create Table - Composite PK
-- Question: Create a high-throughput logging table system_events using event_id (BIGINT),
-- node_id (SMALLINT), event_payload (TEXT), and logged_time (TIMESTAMP). Define a composite
-- primary key on (event_id, node_id).
-- ============================================================
USE lab1_db;

CREATE TABLE system_events (
    event_id      BIGINT,
    node_id       SMALLINT,
    event_payload TEXT,
    logged_time   TIMESTAMP,
    PRIMARY KEY (event_id, node_id)
);

-- Verify
DESCRIBE system_events;
