-- using CTAS ( Create Table As Select )

CREATE TABLE high_paid_employees As
Select 
    employee_id,
    first_name,
    last_name,
    salary
From employees
Where salary > 100000;

-- TEMPORARY TABLE ( only exists during the session )
--  when to use : To use a table for intermediate calculations or data processing within a session.

CREATE TEMPORARY TABLE temp_high_paid_employees As
Select 
    employee_id,
    first_name,
    last_name,
    salary
From employees
Where salary > 100000;

INSERT INTO temp_high_paid_employees 
Select
    employee_id,
    first_name,
    last_name,
    salary
From employees
Where salary > 120000; 

-- Using CTE ( Common Table Expression )
-- when to use : To simplify complex queries and improve readability without creating a physical table.

With high_paid_employees_via_cte AS (
    Select 
        employee_id,
        first_name,
        last_name,
        salary
    From employees
    Where salary > 100000
)

Select * From high_paid_employees_via_cte;