``` sql

mysql> use fdrp;
Database changed
mysql> CREATE TABLE papers (
    ->     id INT PRIMARY KEY,
    ->     status VARCHAR(20)
    -> );
Query OK, 0 rows affected (0.26 sec)

mysql>
mysql> CREATE TABLE paper_audit (
    ->     paper_id INT,
    ->     old_status VARCHAR(20),
    ->     new_status VARCHAR(20),
    ->     changed_at DATETIME
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> INSERT INTO papers VALUES (1, 'submitted');
Query OK, 1 row affected (0.27 sec)

mysql> select * from paprt_audit;
ERROR 1146 (42S02): Table 'fdrp.paprt_audit' doesn't exist
mysql> select * from paper_audit;
Empty set (0.03 sec)

mysql> select * from papers;
+----+-----------+
| id | status    |
+----+-----------+
|  1 | submitted |
+----+-----------+
1 row in set (0.00 sec)

mysql> UPDATE papers
    -> SET status = 'approved'
    -> WHERE id = 1;
Query OK, 1 row affected (0.04 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from paper_audit;
Empty set (0.00 sec)

mysql> DELIMITER $$
mysql>
mysql> CREATE TRIGGER paper_status_audit
    -> AFTER UPDATE ON papers
    -> FOR EACH ROW
    ->
    -> /*
   /*> Trigger executes once per row
   /*> If an UPDATE affects 10 rows → trigger runs 10 times
   /*> */
    -> BEGIN
    ->     IF OLD.status <> NEW.status THEN
    ->         INSERT INTO paper_audit (
    ->             paper_id,
    ->             old_status,
    ->             new_status,
    ->             changed_at
    ->         )
    ->         VALUES (
    ->             OLD.id,
    ->             OLD.status,
    ->             NEW.status,
    ->             NOW()
    ->         );
    ->     END IF;
    -> END$$
Query OK, 0 rows affected (0.10 sec)

mysql>
mysql> use fdrp;
Database changed
mysql> INSERT INTO papers VALUES (2, 'submitted');
Query OK, 1 row affected (0.06 sec)

mysql> select * from papers;
+----+-----------+
| id | status    |
+----+-----------+
|  1 | approved  |
|  2 | submitted |
+----+-----------+
2 rows in set (0.01 sec)

mysql> select * from papers_audit;
ERROR 1146 (42S02): Table 'fdrp.papers_audit' doesn't exist
mysql> show tables;
+----------------+
| Tables_in_fdrp |
+----------------+
| paper_audit    |
| papers         |
+----------------+
2 rows in set (0.06 sec)

mysql> select * from paper_audit;
Empty set (0.00 sec)

mysql> UPDATE papers
    -> SET status = 'approved'
    -> WHERE id = 2;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from papers;
+----+----------+
| id | status   |
+----+----------+
|  1 | approved |
|  2 | approved |
+----+----------+
2 rows in set (0.00 sec)

mysql> select * from paper_audit;
+----------+------------+------------+---------------------+
| paper_id | old_status | new_status | changed_at          |
+----------+------------+------------+---------------------+
|        2 | submitted  | approved   | 2026-01-16 23:42:13 |
+----------+------------+------------+---------------------+
1 row in set (0.00 sec)

mysql>

````
