-- query insdie the query  or nested queries

use ecom;




create table customers
(
    customer_id INT PRIMARY KEY ,
    customer_name varchar(100),
    city varchar(100) 
);

insert into customers value (1,'gomo','pondy');
insert into customers value (2,'harish','madurai');
insert into customers value (3,'gomathy','Puduvai');
insert into customers value (4,'monesh','Puducherry');
insert into customers value (5,'deva','Tamil Nadu');

+-------------+---------------+------------+
| customer_id | customer_name | city       |
+-------------+---------------+------------+
|           1 | gomo          | pondy      |
|           2 | harish        | madurai    |
|           3 | gomathy       | Puduvai    |
|           4 | monesh        | Puducherry |
|           5 | deva          | Tamil Nadu |
+-------------+---------------+------------+


create table orders
(
    order_id INT PRIMARY KEY,
    customer_id INT  ,
    order_amount DECIMAL (10,2),
    order_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);

insert into orders values (1,1,500.00,'2025-12-25 08:00:00');
insert into orders values (2,2,200.00,'2025-12-24 07:00:00');
insert into orders values (3,3,400.00,'2025-12-23 06:00:00');
insert into orders values (4,4,100.00,'2025-12-22 05:00:00');

+----------+-------------+--------------+---------------------+
| order_id | customer_id | order_amount | order_date          |
+----------+-------------+--------------+---------------------+
|        1 |           1 |       500.00 | 2025-12-25 08:00:00 |
|        2 |           2 |       200.00 | 2025-12-24 07:00:00 |
|        3 |           3 |       400.00 | 2025-12-23 06:00:00 |
|        4 |           4 |       100.00 | 2025-12-22 05:00:00 |
+----------+-------------+--------------+---------------------+


select customer_name from customers;

+---------------+
| customer_name |
+---------------+
| gomo          |
| harish        |
| gomathy       |
| monesh        |
| deva          |
+---------------+

-- now we need to take the max order amount

select 
customer_name ,
(select max(order_amount) from orders ) as max_order_amount
from customers;

+---------------+------------------+
| customer_name | max_order_amount |
+---------------+------------------+
| gomo          |           500.00 |
| harish        |           500.00 |
| gomathy       |           500.00 |
| monesh        |           500.00 |
| deva          |           500.00 |
+---------------+------------------+

select 

-- 03:09:43