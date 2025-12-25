-- manipulating data using funtions  similar to String functions in programming

use ecom;

create table CustomerData2 
(
    id INT PRIMARY KEY ,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(10),
    city VARCHAR(100)
);


insert into customerdata2 values (1,'monesh','monesh@gmail.com','9876543213','Pondy');
insert into customerdata2 values (2,'harish','harish@gmail.com','1234565432','Puduvai');
insert into customerdata2 values (3,'gomathy','gomathy@gmail.com','5647386424','Tamil Nadu');
insert into customerdata2 values (4,'deva','deva@gmail.com','9854678549','Kerala');
insert into customerdata2 values (5,'nethra','nethra@gmail.com','5647323454','Brindhavanam');
insert into customerdata2 values (6,'rakshitha','rakshitha@gmail.com','1234544321','Andra');

+----+---------------+---------------------+--------------+--------------+
| id | customer_name | email               | phone_number | city         |
+----+---------------+---------------------+--------------+--------------+
|  1 | monesh        | monesh@gmail.com    | 9876543213   | Pondy        |
|  2 | harish        | harish@gmail.com    | 1234565432   | Puduvai      |
|  3 | gomathy       | gomathy@gmail.com   | 5647386424   | Tamil Nadu   |
|  4 | deva          | deva@gmail.com      | 9854678549   | Kerala       |
|  5 | nethra        | nethra@gmail.com    | 5647323454   | Brindhavanam |
|  6 | rakshitha     | rakshitha@gmail.com | 1234544321   | Andra        |
+----+---------------+---------------------+--------------+--------------+

select length (customer_name) as name_lenght from customerdata2;

+-------------+
| name_lenght |
+-------------+
|           6 |
|           6 |
|           7 |
|           4 |
|           6 |
|           9 |
+-------------+

select length (customer_name) as name_lenght ,
upper (city) as city_name ,
lower ( customer_name) as lower_customer_name
from customerdata2;

+-------------+--------------+---------------------+
| name_lenght | city_name    | lower_customer_name |
+-------------+--------------+---------------------+
|           6 | PONDY        | monesh              |
|           6 | PUDUVAI      | harish              |
|           7 | TAMIL NADU   | gomathy             |
|           4 | KERALA       | deva                |
|           6 | BRINDHAVANAM | nethra              |
|           9 | ANDRA        | rakshitha           |
+-------------+--------------+---------------------+

select length (customer_name) as name_lenght ,
upper (city) as city_name ,
lower ( customer_name) as lower_customer_name,

concat (customer_name,'-',city) as name_city
from customerdata2;

+-------------+--------------+---------------------+---------------------+
| name_lenght | city_name    | lower_customer_name | name_city           |
+-------------+--------------+---------------------+---------------------+
|           6 | PONDY        | monesh              | monesh-Pondy        |
|           6 | PUDUVAI      | harish              | harish-Puduvai      |
|           7 | TAMIL NADU   | gomathy             | gomathy-Tamil Nadu  |
|           4 | KERALA       | deva                | deva-Kerala         |
|           6 | BRINDHAVANAM | nethra              | nethra-Brindhavanam |
|           9 | ANDRA        | rakshitha           | rakshitha-Andra     |
+-------------+--------------+---------------------+---------------------+


select length (customer_name) as name_lenght ,
upper (city) as city_name ,
lower ( customer_name) as lower_customer_name,

concat (customer_name,'-',city,'-TN') as name_city
from customerdata2;

+-------------+--------------+---------------------+------------------------+
| name_lenght | city_name    | lower_customer_name | name_city              |
+-------------+--------------+---------------------+------------------------+
|           6 | PONDY        | monesh              | monesh-Pondy-TN        |
|           6 | PUDUVAI      | harish              | harish-Puduvai-TN      |
|           7 | TAMIL NADU   | gomathy             | gomathy-Tamil Nadu-TN  |
|           4 | KERALA       | deva                | deva-Kerala-TN         |
|           6 | BRINDHAVANAM | nethra              | nethra-Brindhavanam-TN |
|           9 | ANDRA        | rakshitha           | rakshitha-Andra-TN     |
+-------------+--------------+---------------------+------------------------+




select length (customer_name) as name_lenght ,
upper (city) as city_name ,
lower ( customer_name) as lower_customer_name,

concat (customer_name,'-',city) as name_city ,
substring(customer_name,1,3) as name_prefix
from customerdata2;

+-------------+--------------+---------------------+---------------------+-------------+
| name_lenght | city_name    | lower_customer_name | name_city           | name_prefix |
+-------------+--------------+---------------------+---------------------+-------------+
|           6 | PONDY        | monesh              | monesh-Pondy        | mon         |
|           6 | PUDUVAI      | harish              | harish-Puduvai      | har         |
|           7 | TAMIL NADU   | gomathy             | gomathy-Tamil Nadu  | gom         |
|           4 | KERALA       | deva                | deva-Kerala         | dev         |
|           6 | BRINDHAVANAM | nethra              | nethra-Brindhavanam | net         |
|           9 | ANDRA        | rakshitha           | rakshitha-Andra     | rak         |
+-------------+--------------+---------------------+---------------------+-------------+

insert into customerdata2 values (7,'   dharika   ','dharika@gmail.com','1233744321','Tamil Nadu');

+----+---------------+---------------------+--------------+--------------+
| id | customer_name | email               | phone_number | city         |
+----+---------------+---------------------+--------------+--------------+
|  1 | monesh        | monesh@gmail.com    | 9876543213   | Pondy        |
|  2 | harish        | harish@gmail.com    | 1234565432   | Puduvai      |
|  3 | gomathy       | gomathy@gmail.com   | 5647386424   | Tamil Nadu   |
|  4 | deva          | deva@gmail.com      | 9854678549   | Kerala       |
|  5 | nethra        | nethra@gmail.com    | 5647323454   | Brindhavanam |
|  6 | rakshitha     | rakshitha@gmail.com | 1234544321   | Andra        |
|  7 |    dharika    | dharika@gmail.com   | 1233744321   | Tamil Nadu   |
+----+---------------+---------------------+--------------+--------------+


-- using trim()

select

trim(customer_name) as trimmed_name ,
trim(city) as trimmed_city
from
customerdata2 ;


+--------------+--------------+
| trimmed_name | trimmed_city |
+--------------+--------------+
| monesh       | Pondy        |
| harish       | Puduvai      |
| gomathy      | Tamil Nadu   |
| deva         | Kerala       |
| nethra       | Brindhavanam |
| rakshitha    | Andra        |
| dharika      | Tamil Nadu   |
+--------------+--------------+

insert into customerdata2 values (8,'gomo','gomo@gmail.com','1233744321','     Tamil Nadu');

+----+---------------+---------------------+--------------+-----------------+
| id | customer_name | email               | phone_number | city            |
+----+---------------+---------------------+--------------+-----------------+
|  1 | monesh        | monesh@gmail.com    | 9876543213   | Pondy           |
|  2 | harish        | harish@gmail.com    | 1234565432   | Puduvai         |
|  3 | gomathy       | gomathy@gmail.com   | 5647386424   | Tamil Nadu      |
|  4 | deva          | deva@gmail.com      | 9854678549   | Kerala          |
|  5 | nethra        | nethra@gmail.com    | 5647323454   | Brindhavanam    |
|  6 | rakshitha     | rakshitha@gmail.com | 1234544321   | Andra           |
|  7 |    dharika    | dharika@gmail.com   | 1233744321   | Tamil Nadu      |
|  8 | gomo          | gomo@gmail.com      | 1233744321   |      Tamil Nadu |
+----+---------------+---------------------+--------------+-----------------+

select

trim(customer_name) as trimmed_name ,
trim(city) as trimmed_city
from
customerdata2 ;

+--------------+--------------+
| trimmed_name | trimmed_city |
+--------------+--------------+
| monesh       | Pondy        |
| harish       | Puduvai      |
| gomathy      | Tamil Nadu   |
| deva         | Kerala       |
| nethra       | Brindhavanam |
| rakshitha    | Andra        |
| dharika      | Tamil Nadu   |
| gomo         | Tamil Nadu   |
+--------------+--------------+

-- using rtrim() and ltrim()


-- lpad and rpad


select
id,
trim(customer_name) ,
trim(city) as trimmed_city,
LPAD(customer_name,15,'*') as left_padding
from
customerdata2 ;

+----+---------------------+--------------+-----------------+
| id | trim(customer_name) | trimmed_city | left_padding    |
+----+---------------------+--------------+-----------------+
|  1 | monesh              | Pondy        | *********monesh |
|  2 | harish              | Puduvai      | *********harish |
|  3 | gomathy             | Tamil Nadu   | ********gomathy |
|  4 | deva                | Kerala       | ***********deva |
|  5 | nethra              | Brindhavanam | *********nethra |
|  6 | rakshitha           | Andra        | ******rakshitha |
|  7 | dharika             | Tamil Nadu   | **   dharika    |
|  8 | gomo                | Tamil Nadu   | ***********gomo |
+----+---------------------+--------------+-----------------+


select
id,
trim(customer_name) ,
trim(city) as trimmed_city,
RPAD(customer_name,15,'*') as right_padding
from
customerdata2 ;

+----+---------------------+--------------+-----------------+
| id | trim(customer_name) | trimmed_city | right_padding   |
+----+---------------------+--------------+-----------------+
|  1 | monesh              | Pondy        | monesh********* |
|  2 | harish              | Puduvai      | harish********* |
|  3 | gomathy             | Tamil Nadu   | gomathy******** |
|  4 | deva                | Kerala       | deva*********** |
|  5 | nethra              | Brindhavanam | nethra********* |
|  6 | rakshitha           | Andra        | rakshitha****** |
|  7 | dharika             | Tamil Nadu   |    dharika   ** |
|  8 | gomo                | Tamil Nadu   | gomo*********** |
+----+---------------------+--------------+-----------------+


-- replace


select
id,
replace(customer_name,' ','_') ,
replace(city,' ','_') 
from
customerdata2 ;


+----+--------------------------------+-----------------------+
| id | replace(customer_name,' ','_') | replace(city,' ','_') |
+----+--------------------------------+-----------------------+
|  1 | monesh                         | Pondy                 |
|  2 | harish                         | Puduvai               |
|  3 | gomathy                        | Tamil_Nadu            |
|  4 | deva                           | Kerala                |
|  5 | nethra                         | Brindhavanam          |
|  6 | rakshitha                      | Andra                 |
|  7 | ___dharika___                  | Tamil_Nadu            |
|  8 | gomo                           | _____Tamil_Nadu       |
+----+--------------------------------+-----------------------+

-- inString()

select
id,
INSTR(customer_name,'a')
from
customerdata2 ;

+----+--------------------------+
| id | INSTR(customer_name,'a') |
+----+--------------------------+
|  1 |                        0 |
|  2 |                        2 |
|  3 |                        4 |
|  4 |                        4 |
|  5 |                        6 |
|  6 |                        2 |
|  7 |                        6 |
|  8 |                        0 |
+----+--------------------------+


select
id,
right(customer_name,5)
from
customerdata2;

+----+------------------------+
| id | right(customer_name,5) |
+----+------------------------+
|  1 | onesh                  |
|  2 | arish                  |
|  3 | mathy                  |
|  4 | deva                   |
|  5 | ethra                  |
|  6 | hitha                  |
|  7 | ka                     |
|  8 | gomo                   |
+----+------------------------+


select
id,
left(customer_name,5)
from
customerdata2;

+----+-----------------------+
| id | left(customer_name,5) |
+----+-----------------------+
|  1 | mones                 |
|  2 | haris                 |
|  3 | gomat                 |
|  4 | deva                  |
|  5 | nethr                 |
|  6 | raksh                 |
|  7 |    dh                 |
|  8 | gomo                  |
+----+-----------------------+

-- stringReverse()

select
id,
reverse(customer_name) as reversed_customer_name
from
customerdata2;

+----+------------------------+
| id | reversed_customer_name |
+----+------------------------+
|  1 | hsenom                 |
|  2 | hsirah                 |
|  3 | yhtamog                |
|  4 | aved                   |
|  5 | arhten                 |
|  6 | ahtihskar              |
|  7 |    akirahd             |
|  8 | omog                   |
+----+------------------------+

-- format() 

select
id,
trim(customer_name),
format(8458483234,2) as formatted_number
from
customerdata2;

+----+---------------------+------------------+
| id | trim(customer_name) | formatted_number |
+----+---------------------+------------------+
|  1 | monesh              | 8,458,483,234.00 |
|  2 | harish              | 8,458,483,234.00 |
|  3 | gomathy             | 8,458,483,234.00 |
|  4 | deva                | 8,458,483,234.00 |
|  5 | nethra              | 8,458,483,234.00 |
|  6 | rakshitha           | 8,458,483,234.00 |
|  7 | dharika             | 8,458,483,234.00 |
|  8 | gomo                | 8,458,483,234.00 |
+----+---------------------+------------------+

-- calling function() from a function()

select
id,
upper(concat(customer_name,'_',city))
from customerdata2;

+----+---------------------------------------+
| id | upper(concat(customer_name,'_',city)) |
+----+---------------------------------------+
|  1 | MONESH_PONDY                          |
|  2 | HARISH_PUDUVAI                        |
|  3 | GOMATHY_TAMIL NADU                    |
|  4 | DEVA_KERALA                           |
|  5 | NETHRA_BRINDHAVANAM                   |
|  6 | RAKSHITHA_ANDRA                       |
|  7 |    DHARIKA   _TAMIL NADU              |
|  8 | GOMO_     TAMIL NADU                  |
+----+---------------------------------------+


