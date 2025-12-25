use ecom;

create table CustomerData 
(
    id INT PRIMARY KEY ,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(10),
    address VARCHAR(100),
    amount  DECIMAL(10,2)
);


insert into customerdata values (1,'monesh','monesh@gmail.com','9876543213','amman nagar',1000.00);
insert into customerdata values (2,'harish','harish@gmail.com','1234565432','amman nagar',5000.00);
insert into customerdata values (3,'gomathy','gomathy@gmail.com','5647386424','amman nagar',5400.00);
insert into customerdata values (4,'deva','deva@gmail.com','9854678549','kali nagar',8000.00);
insert into customerdata values (5,'nethra','nethra@gmail.com','5647323454','krishna nagar',4200.00);
insert into customerdata values (6,'rakshitha','rakshitha@gmail.com','432454456776','alla nagar',51000.00);

+----+---------------+---------------------+--------------+-------------+----------+
| id | customer_name | email               | phone_number | address     | amount   |
+----+---------------+---------------------+--------------+-------------+----------+
|  1 | monesh        | monesh@gmail.com    | 9876543213   | NULL        |  1000.00 |
|  2 | harish        | harish@gmail.com    | NULL         | amman nagar |  5000.00 |
|  3 | gomathy       | gomathy@gmail.com   | 5647386424   | amman nagar |  5400.00 |
|  4 | deva          | NULL                | 9854678549   | kali nagar  |  8000.00 |
|  5 | nethra        | nethra@gmail.com    | 5647323454   | NULL        |  4200.00 |
|  6 | rakshitha     | rakshitha@gmail.com | NULL         | alla nagar  | 51000.00 |
+----+---------------+---------------------+--------------+-------------+----------+

-- how many records container null in phone numbers

select COUNT(*) from customerdata where phone_number=NULL;

+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+

-- why (( 0  )) , because using null values we cant able to do with any operator instead of we need to use (( is null))


select COUNT(*) from customerdata where phone_number IS NULL ;

+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

select COUNT(*) from customerdata where phone_number IS NOT  NULL ;

+----------+
| COUNT(*) |
+----------+
|        4 |
+----------+

-- getting null from more than 1 column


select

customer_name,
email,
phone_number,
address

from customerdata 

where  email IS NULL 
OR phone_number IS NULL  
OR address IS NULL
OR amount IS NULL ;

+---------------+---------------------+--------------+-------------+
| customer_name | email               | phone_number | address     |
+---------------+---------------------+--------------+-------------+
| monesh        | monesh@gmail.com    | 9876543213   | NULL        |
| harish        | harish@gmail.com    | NULL         | amman nagar |
| deva          | NULL                | 9854678549   | kali nagar  |
| nethra        | nethra@gmail.com    | 5647323454   | NULL        |
| rakshitha     | rakshitha@gmail.com | NULL         | alla nagar  |
+---------------+---------------------+--------------+-------------+

-- using AND 
select

customer_name,
email,
phone_number,
address

from customerdata 

where  email IS NULL 
AND phone_number IS NULL  
AND address IS NULL
AND amount IS NULL ;

Empty set (0.00 sec)

-- adding dummy data instead of null using colase

insert into customerdata values (7,'dhinesh','dhinesh@gmail.com','5647323454','poornakuppam',NULL);
insert into customerdata values (8,'manikandan','mk@gmail.com','1234565432','rainbow nagar',NULL);

update customerdata set amount=NULL where id=1;

+----+---------------+---------------------+--------------+---------------+----------+
| id | customer_name | email               | phone_number | address       | amount   |
+----+---------------+---------------------+--------------+---------------+----------+
|  1 | monesh        | monesh@gmail.com    | 9876543213   | NULL          |     NULL |
|  2 | harish        | harish@gmail.com    | NULL         | amman nagar   |  5000.00 |
|  3 | gomathy       | gomathy@gmail.com   | 5647386424   | amman nagar   |  5400.00 |
|  4 | deva          | NULL                | 9854678549   | kali nagar    |  8000.00 |
|  5 | nethra        | nethra@gmail.com    | 5647323454   | NULL          |  4200.00 |
|  6 | rakshitha     | rakshitha@gmail.com | NULL         | alla nagar    | 51000.00 |
|  7 | dhinesh       | dhinesh@gmail.com   | 5647323454   | poornakuppam  |     NULL |
|  8 | manikandan    | mk@gmail.com        | 1234565432   | rainbow nagar |     NULL |
+----+---------------+---------------------+--------------+---------------+----------+

select

customer_name,
amount

from customerdata where amount IS NULL;

+---------------+--------+
| customer_name | amount |
+---------------+--------+
| monesh        |   NULL |
| dhinesh       |   NULL |
| manikandan    |   NULL |
+---------------+--------+

select
id,
customer_name,
amount ,
coalesce (amount,'0.00')  -- set the first NOT NULL value

from customerdata;

+----+---------------+----------+--------------------------+
| id | customer_name | amount   | coalesce (amount,'0.00') |
+----+---------------+----------+--------------------------+
|  1 | monesh        |     NULL | 0.00                     |
|  2 | harish        |  5000.00 | 5000.00                  |
|  3 | gomathy       |  5400.00 | 5400.00                  |
|  4 | deva          |  8000.00 | 8000.00                  |
|  5 | nethra        |  4200.00 | 4200.00                  |
|  6 | rakshitha     | 51000.00 | 51000.00                 |
|  7 | dhinesh       |     NULL | 0.00                     |
|  8 | manikandan    |     NULL | 0.00                     |
+----+---------------+----------+--------------------------+

-- we can able to pass more arguments in coalesce

-- another appraoch using IF NULL


select
id,
customer_name,
amount ,
IFNULL (amount,'0.00')  -- only two arguments

from customerdata;

+----+---------------+----------+------------------------+
| id | customer_name | amount   | IFNULL (amount,'0.00') |
+----+---------------+----------+------------------------+
|  1 | monesh        |     NULL | 0.00                   |
|  2 | harish        |  5000.00 | 5000.00                |
|  3 | gomathy       |  5400.00 | 5400.00                |
|  4 | deva          |  8000.00 | 8000.00                |
|  5 | nethra        |  4200.00 | 4200.00                |
|  6 | rakshitha     | 51000.00 | 51000.00               |
|  7 | dhinesh       |     NULL | 0.00                   |
|  8 | manikandan    |     NULL | 0.00                   |
+----+---------------+----------+------------------------+

