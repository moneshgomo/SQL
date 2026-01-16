use fdrp;


CREATE TABLE papers (
    id INT PRIMARY KEY,
    status VARCHAR(20)
);

CREATE TABLE paper_audit (
    paper_id INT,
    old_status VARCHAR(20),
    new_status VARCHAR(20),
    changed_at DATETIME
);

-- Trigger Implementation

DELIMITER $$

CREATE TRIGGER paper_status_audit
AFTER UPDATE ON papers
FOR EACH ROW

/*
Trigger executes once per row
If an UPDATE affects 10 rows → trigger runs 10 times
*/
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO paper_audit (
            paper_id,
            old_status,
            new_status,
            changed_at
        )
        VALUES (
            OLD.id,
            OLD.status,
            NEW.status,
            NOW()
        );
    END IF;
END$$

DELIMITER ;


INSERT INTO papers VALUES (2, 'submitted');

UPDATE papers
SET status = 'approved'
WHERE id = 2;
