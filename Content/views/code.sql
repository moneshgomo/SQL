use uber;


CREATE TABLE employees ( 
    
    employee_id INT PRIMARY KEY,
    first_nane VARCHAR(50), 
    last_name VARCHAR(50), 
    email VARCHAR(100), 
    hire_date DATE, 
    job_title VARCHAR(50), 
    salary DECIMAL(10, 2) 
);


INSERT INTO employees 
(employee_id, first_nane, last_name, email, hire_date, job_title, salary)
VALUES
(1, 'Arun', 'Kumar', 'arun.kumar@company.com', '2021-01-15', 'Software Engineer', 75000.00),
(2, 'Priya', 'Sharma', 'priya.sharma@company.com', '2020-06-10', 'Senior Software Engineer', 98000.00),
(3, 'Ravi', 'Verma', 'ravi.verma@company.com', '2019-03-22', 'Tech Lead', 120000.00),
(4, 'Sneha', 'Iyer', 'sneha.iyer@company.com', '2022-08-01', 'QA Engineer', 65000.00),
(5, 'Amit', 'Patel', 'amit.patel@company.com', '2018-11-05', 'Project Manager', 135000.00),
(6, 'Neha', 'Singh', 'neha.singh@company.com', '2021-04-18', 'Business Analyst', 85000.00),
(7, 'Karthik', 'Rao', 'karthik.rao@company.com', '2023-02-12', 'Junior Developer', 55000.00),
(8, 'Meena', 'Das', 'meena.das@company.com', '2017-09-30', 'HR Manager', 90000.00);


-- filter where the employee get salary from above 9000

select employee_id,first_nane,last_name,salary 
from employees 
where salary > 9000;

+-------------+------------+-----------+-----------+
| employee_id | first_nane | last_name | salary    |
+-------------+------------+-----------+-----------+
|           1 | Arun       | Kumar     |  75000.00 |
|           2 | Priya      | Sharma    |  98000.00 |
|           3 | Ravi       | Verma     | 120000.00 |
|           4 | Sneha      | Iyer      |  65000.00 |
|           5 | Amit       | Patel     | 135000.00 |
|           6 | Neha       | Singh     |  85000.00 |
|           7 | Karthik    | Rao       |  55000.00 |
|           8 | Meena      | Das       |  90000.00 |
+-------------+------------+-----------+-----------+

-- using CTAS ( create table using Select )

create view high_earners as 
select employee_id,first_nane,last_name,salary 
from employees 
where salary > 9000;

mysql> select * from high_earners;
+-------------+------------+-----------+-----------+
| employee_id | first_nane | last_name | salary    |
+-------------+------------+-----------+-----------+
|           1 | Arun       | Kumar     |  75000.00 |
|           2 | Priya      | Sharma    |  98000.00 |
|           3 | Ravi       | Verma     | 120000.00 |
|           4 | Sneha      | Iyer      |  65000.00 |
|           5 | Amit       | Patel     | 135000.00 |
|           6 | Neha       | Singh     |  85000.00 |
|           7 | Karthik    | Rao       |  55000.00 |
|           8 | Meena      | Das       |  90000.00 |
+-------------+------------+-----------+-----------+

