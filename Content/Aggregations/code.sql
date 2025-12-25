use ecom;

create table CustomerTransactions
(
    id INT PRIMARY KEY ,
    login_device VARCHAR(100),
    customer_name VARCHAR(100),
    ip_address VARCHAR(100),
    product VARCHAR(100),
    amount DECIMAL(10,2),
    is_placed BOOLEAN ,
    is_viewed BOOLEAN ,
    transaction_state VARCHAR(26)
);

insert into customertransactions values (1,'Mobile','Gomo','192.166.193.204','bat',20000.00,TRUE,TRUE,'completed');
insert into customertransactions values (2,'Laptop','monesh','192.166.192.204','laptop',50000.00,TRUE,FALSE,'completed');
insert into customertransactions values (3,'Mobile','harish','192.166.191.204','bat',50000.00,TRUE,TRUE,'completed');
insert into customertransactions values (4,'Laptop','harish','192.166.199.204','laptop',70000.00,TRUE,FALSE,'completed');
insert into customertransactions values (5,'Mobile','dharika','192.166.188.204','tab',50000.00,TRUE,TRUE,'completed');
insert into customertransactions values (6,'Laptop','monesh','192.166.148.204','bat',80000.00,TRUE,FALSE,'completed');
insert into customertransactions values (7,'Mobile','harish','192.166.138.204','tab',50000.00,TRUE,TRUE,'completed');
insert into customertransactions values (8,'Laptop','Gomo','192.166.198.104','bat',30000.00,TRUE,TRUE,'completed');
insert into customertransactions values (9,'Mobile','harish','132.166.198.204','tab',10000.00,TRUE,FALSE,'completed');
insert into customertransactions values (10,'Laptop','dharika','192.136.198.204','laptop',560000.00,TRUE,FALSE,'completed');


+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+
| id | login_device | customer_name | ip_address      | product | amount    | is_placed | is_viewed | transaction_state |
+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+
|  1 | Mobile       | Gomo          | 192.166.198.204 | tab     |  50000.00 |         1 |         0 | completed         |
|  2 | Laptop       | monesh        | 192.166.192.204 | laptop  |  50000.00 |         1 |         0 | completed         |
|  3 | Mobile       | harish        | 192.166.191.204 | bat     |  50000.00 |         1 |         1 | completed         |
|  4 | Laptop       | harish        | 192.166.199.204 | laptop  |  70000.00 |         1 |         0 | completed         |
|  5 | Mobile       | dharika       | 192.166.188.204 | tab     |  50000.00 |         1 |         1 | completed         |
|  6 | Laptop       | monesh        | 192.166.148.204 | bat     |  80000.00 |         1 |         0 | completed         |
|  7 | Mobile       | harish        | 192.166.138.204 | tab     |  50000.00 |         1 |         1 | completed         |
|  8 | Laptop       | Gomo          | 192.166.198.104 | bat     |  30000.00 |         1 |         1 | completed         |
|  9 | Mobile       | harish        | 132.166.198.204 | tab     |  10000.00 |         1 |         0 | completed         |
| 10 | Laptop       | dharika       | 192.136.198.204 | laptop  | 560000.00 |         1 |         0 | completed         |
+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+

-- COUNT [ in , or , and , distinct , not in ]

select COUNT(*) from customertransactions;

10

select COUNT(*) from customertransactions where login_device='Mobile';

5

select COUNT(*) from customertransactions where login_device='Mobile' and product='bat';

1

select COUNT(*) from customertransactions where login_device='Mobile' or product='bat';

7

select COUNT(*) from customertransactions where product in ('bat','tab');

7


-- finding the total revenue of succeded transactions

select SUM(amount) from customertransactions where transaction_state='completed';

1000000.00 

-- setting alias 

select SUM(amount) as total_transaction from customertransactions where transaction_state='completed';


+-------------------+
| total_transaction |
+-------------------+
|        1000000.00 |
+-------------------+

-- minimum transactions

select MIN(amount) as minimum_amount from CustomerTransactions;

10000.00

select MAX(amount) as max_amount from CustomerTransactions;

560000.00

select AVG(amount) as avg_amount from CustomerTransactions;

100000.000000

-- groupBy 

select login_device , sum(amount) as total_amount  from customertransactions GROUP BY (login_device);

+--------------+--------------+
| login_device | total_amount |
+--------------+--------------+
| Mobile       |    210000.00 |
| Laptop       |    790000.00 |
+--------------+--------------+


-- having  ( ? )

select login_device , sum(amount) as total_amount  from customertransactions GROUP BY (login_device);

-- case condition ( in programming if , else if )


select 

case
    when 8 > 10 then 'true'
    else 'false'
end as test ;

+-------+
| test  |
+-------+
| false |
+-------+

+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+
| id | login_device | customer_name | ip_address      | product | amount    | is_placed | is_viewed | transaction_state |
+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+
|  1 | Mobile       | Gomo          | 192.166.198.204 | tab     |  50000.00 |         1 |         0 | completed         |
|  2 | Laptop       | monesh        | 192.166.192.204 | laptop  |  50000.00 |         1 |         0 | completed         |
|  3 | Mobile       | harish        | 192.166.191.204 | bat     |  50000.00 |         1 |         1 | completed         |
|  4 | Laptop       | harish        | 192.166.199.204 | laptop  |  70000.00 |         1 |         0 | completed         |
|  5 | Mobile       | dharika       | 192.166.188.204 | tab     |  50000.00 |         1 |         1 | completed         |
|  6 | Laptop       | monesh        | 192.166.148.204 | bat     |  80000.00 |         1 |         0 | completed         |
|  7 | Mobile       | harish        | 192.166.138.204 | tab     |  50000.00 |         1 |         1 | completed         |
|  8 | Laptop       | Gomo          | 192.166.198.104 | bat     |  30000.00 |         1 |         1 | completed         |
|  9 | Mobile       | harish        | 132.166.198.204 | tab     |  10000.00 |         1 |         0 | completed         |
| 10 | Laptop       | dharika       | 192.136.198.204 | laptop  | 560000.00 |         1 |         0 | completed         |
+----+--------------+---------------+-----------------+---------+-----------+-----------+-----------+-------------------+


-- 02:35:30

select
    customer_name,
    amount ,

case 
    when  amount > 4000 THEN 'high spender'
    when amount BETWEEN 2000 AND 4000 THEN 'medium spender'
    when amount <= 2000 THEN 'low spender'

    end as spending 

else 'no data'

from

customertransactions;

+---------------+-----------+--------------+
| customer_name | amount    | spending     |
+---------------+-----------+--------------+
| Gomo          |  50000.00 | high spender |
| monesh        |  50000.00 | high spender |
| harish        |  50000.00 | high spender |
| harish        |  70000.00 | high spender |
| dharika       |  50000.00 | high spender |
| monesh        |  80000.00 | high spender |
| harish        |  50000.00 | high spender |
| Gomo          |  30000.00 | high spender |
| harish        |  10000.00 | high spender |
| dharika       | 560000.00 | high spender |
+---------------+-----------+--------------+

insert into customertransactions values (11,'Mobile','gomathy','132.186.128.204','tab',3000.00,TRUE,FALSE,'completed');

+---------------+-----------+----------------+
| customer_name | amount    | spending       |
+---------------+-----------+----------------+
| Gomo          |  50000.00 | high spender   |
| monesh        |  50000.00 | high spender   |
| harish        |  50000.00 | high spender   |
| harish        |  70000.00 | high spender   |
| dharika       |  50000.00 | high spender   |
| monesh        |  80000.00 | high spender   |
| harish        |  50000.00 | high spender   |
| Gomo          |  30000.00 | high spender   |
| harish        |  10000.00 | high spender   |
| dharika       | 560000.00 | high spender   |
| gomathy       |   3000.00 | medium spender |
+---------------+-----------+----------------+

-- getting the data of the users email who dont have mobile number in the table ( assume )
-- when its comes into when or if conditions the ordering matters ( like adding ArithmethicException after the Ecxeption e in the catch block)
select

customer_name ,

case
    when phone_number is null then email
    else phone_number
end as contact 

from customerData ;




