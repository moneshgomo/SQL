-- Setting rules for column

create database uber;

use uber;

create table rides(
    ride_id INT,
    driver_id INT,
    rider_id INT,
    pickUp_location VARCHAR(255),
    drop_location VARCHAR(255),
    ride_date DATETIME,
    fare DECIMAL(10,2)
)


ALTER TABLE rides
MODIFY ride_id INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (ride_id);

-- Composite Primary Key

create table rides(
    ride_id INT NOT NULL,
    driver_id INT NOT NULL,
    rider_id INT,
    pickUp_location VARCHAR(255),
    drop_location VARCHAR(255),
    ride_date DATETIME,
    fare DECIMAL(10,2),
    PRIMARY KEY (ride_id, driver_id)
);

-- when we use composite primary key both ride_id and driver_id together will be unique ( not individually unique like ride_id=11, driver_id=5 and ride_id=11, driver_id=6 is valid)

mysql> desc rides;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | NO   | PRI | NULL    |       |
| rider_id        | int           | YES  |     | NULL    |       |
| pickUp_location | varchar(255)  | YES  |     | NULL    |       |
| drop_location   | varchar(255)  | YES  |     | NULL    |       |
| ride_date       | datetime      | YES  |     | NULL    |       |
| fare            | decimal(10,2) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+


-- Unique Constraint

create table users( 
    user_id INT PRIMARY KEY ,
    email varchar(100) UNIQUE
);

insert into users (user_id, email) values (1, 'user1@example.com');
insert into users (user_id, email) values (2, 'user2@example.com');
insert into users (user_id, email) values (3, NULL); -- NULL is allowed
insert into users (user_id, email) values (4, NULL); -- NULL is allowed
insert into users (user_id, email) values (2, 'user3@example.com');

-- Primary key not allow NULL  and duplicate values  
-- Unique allow n number of NULL but ndo not  allow the duplicate values 


select * from uber.users ORDER BY  user_id ASC;

-- NOT NULL Constraint


create table rides(
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT,
    pickUp_location VARCHAR(255) NOT NULL,
    drop_location VARCHAR(255) NOT NULL,
    ride_date DATETIME,
    fare DECIMAL(10,2) NOT NULL 
);


insert into rides (ride_id, driver_id, rider_id, pickUp_location, drop_location, ride_date, fare) values
(1, 101, 201, 'Location A', 'Location B', ' 2024-01-01 10:00:00', 150.00),
(2, 102, 202, 'Location C', 'Location D', '2024-01-02 11:00:00', 200.00),
(3, 103, 203, 'Location E', 'Location F', NULL , 250.00);


-- check constraint

create table rides(
    ride_id INT PRIMARY KEY,
    driver_id INT NOT NULL,
    rider_id INT,
    pickUp_location VARCHAR(255) NOT NULL,
    drop_location VARCHAR(255) NOT NULL,
    ride_date DATETIME,
    fare DECIMAL(10,2) check (fare > 0)
);

insert into rides (ride_id, driver_id, rider_id, pickUp_location, drop_location, ride_date, fare) values
(1, 101, 201, 'Location A', 'Location B', '2024-01-01 10:00:00', 150.00),
(2, 102, 202, 'Location C', 'Location D', '2024-01-02 11:00:00', -200.00); -- This will fail due to check constraint

-- foreign key constraint


-- ( one to many relationship )

create table drivers(
  driver_id INT PRIMARY KEY ,
  driver_name VARCHAR(100),
  licence_number VARCHAR(100) UNIQUE
);


create table ride(
    ride_id INT PRIMARY KEY,
    driver_id INT ,
    pickUp_location VARCHAR(100),
    drop_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10,2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);


-- while mentioning any column as a forgein key to another table the column musr be primary key or unique in its own table
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | YES  | MUL | NULL    |       |
| pickUp_location | varchar(100)  | YES  |     | NULL    |       |
| drop_location   | varchar(100)  | YES  |     | NULL    |       |
| ride_date       | datetime      | YES  |     | NULL    |       |
| fare            | decimal(10,2) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+


+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| driver_id      | int          | NO   | PRI | NULL    |       |
| driver_name    | varchar(100) | YES  |     | NULL    |       |
| licence_number | varchar(100) | YES  | UNI | NULL    |       |
+----------------+--------------+------+-----+---------+-------+


-- drop table if exists <table_name>


insert into drivers(driver_id,driver_name,licence_number) values (11,'deva','auto-deva');
insert into drivers(driver_id,driver_name,licence_number) values (12,'sankar','auto-sankar');
insert into drivers(driver_id,driver_name,licence_number) values (13,'devu','auto-devu');
insert into drivers(driver_id,driver_name,licence_number) values (14,'gomo','auto-gomo');

+-----------+-------------+----------------+
| driver_id | driver_name | licence_number |
+-----------+-------------+----------------+
|        11 | deva        | auto-deva      |
|        12 | sankar      | auto-sankar    |
|        13 | devu        | auto-devu      |
|        14 | gomo        | auto-gomo      |
+-----------+-------------+----------------+


insert into ride (ride_id, driver_id,pickUp_location,drop_location,ride_date,fare) values (1, 11,'kirumampakkam ','kattukuppam','2025-12-15 08:00:00',10.00);
insert into ride (ride_id, driver_id,pickUp_location,drop_location,ride_date,fare) values (2, 12,'kattukuppam ','kirumampakkam','2025-12-16 08:00:00',10.00);
insert into ride (ride_id, driver_id,pickUp_location,drop_location,ride_date,fare) values (3, 14,'pondy ','cuddalore','2025-12-18 08:00:00',10.00);


-- deleting the record

delete from uber.rides where ride_id=3;
delete from uber.drivers where drivers_id=14;

mysql> delete table drivers where drivers_id=14;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'table drivers where drivers_id=14' at line 1
mysql>  delete from  drivers where drivers_id=14;
ERROR 1054 (42S22): Unknown column 'drivers_id' in 'where clause'
mysql> delete from ride where ride_id=3;
Query OK, 1 row affected (0.01 sec)

mysql>  delete from  drivers where drivers_id=14;
ERROR 1054 (42S22): Unknown column 'drivers_id' in 'where clause'
mysql> delete from drivers where driver_id=14;
Query OK, 1 row affected (0.01 sec)

-- on delete cascade -- 01:42:00

-- drop the exisitng table and create new

drop table uber.ride;
drop table uber.drivers;


create table drivers(
  driver_id INT PRIMARY KEY ,
  driver_name VARCHAR(100),
  licence_number VARCHAR(100) UNIQUE
);


create table ride(
    ride_id INT PRIMARY KEY,
    driver_id INT ,
    pickUp_location VARCHAR(100),
    drop_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10,2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id) ON DELETE CASCADE
);


+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | YES  | MUL | NULL    |       |
| pickUp_location | varchar(100)  | YES  |     | NULL    |       |
| drop_location   | varchar(100)  | YES  |     | NULL    |       |
| ride_date       | datetime      | YES  |     | NULL    |       |
| fare            | decimal(10,2) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+

+----------------+--------------+------+-----+---------+-------+
| Field          | Type         | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| driver_id      | int          | NO   | PRI | NULL    |       |
| driver_name    | varchar(100) | YES  |     | NULL    |       |
| licence_number | varchar(100) | YES  | UNI | NULL    |       |
+----------------+--------------+------+-----+---------+-------+


insert into drivers(driver_id,driver_name,licence_number) values
 (11,'deva','auto-deva'),
 (12,'sankar','auto-sankar'),
 (13,'devu','auto-devu'),
 (14,'gomo','auto-gomo');

insert into ride (ride_id, driver_id,pickUp_location,drop_location,ride_date,fare) values 

 (1, 11,'kirumampakkam ','kattukuppam','2025-12-15 08:00:00',10.00),
 (2, 12,'kattukuppam ','kirumampakkam','2025-12-16 08:00:00',10.00),
 (3, 14,'pondy ','cuddalore','2025-12-18 08:00:00',30.00);


+---------+-----------+-----------------+---------------+---------------------+-------+
| ride_id | driver_id | pickUp_location | drop_location | ride_date           | fare  |
+---------+-----------+-----------------+---------------+---------------------+-------+
|       1 |        11 | kirumampakkam   | kattukuppam   | 2025-12-15 08:00:00 | 10.00 |
|       2 |        12 | kattukuppam     | kirumampakkam | 2025-12-16 08:00:00 | 10.00 |
|       3 |        14 | pondy           | cuddalore     | 2025-12-18 08:00:00 | 30.00 |
+---------+-----------+-----------------+---------------+---------------------+-------+

+-----------+-------------+----------------+
| driver_id | driver_name | licence_number |
+-----------+-------------+----------------+
|        11 | deva        | auto-deva      |
|        12 | sankar      | auto-sankar    |
|        13 | devu        | auto-devu      |
|        14 | gomo        | auto-gomo      |
+-----------+-------------+----------------+

-- let us see the magic of ON_DELETE_CASCADE ( But these cascade implementation are deceided by the solution architect & DB Desining team )


delete from drivers where driver_id=14;

+-----------+-------------+----------------+
| driver_id | driver_name | licence_number |
+-----------+-------------+----------------+
|        11 | deva        | auto-deva      |
|        12 | sankar      | auto-sankar    |
|        13 | devu        | auto-devu      |
+-----------+-------------+----------------+

+---------+-----------+-----------------+---------------+---------------------+-------+
| ride_id | driver_id | pickUp_location | drop_location | ride_date           | fare  |
+---------+-----------+-----------------+---------------+---------------------+-------+
|       1 |        11 | kirumampakkam   | kattukuppam   | 2025-12-15 08:00:00 | 10.00 |
|       2 |        12 | kattukuppam     | kirumampakkam | 2025-12-16 08:00:00 | 10.00 |
+---------+-----------+-----------------+---------------+---------------------+-------+

-- talking about SOFT DELETE in a table  ( just deleting as a mark ) for that just create a new column for that purpose

-- let us create the table again by deleting the existing table 


create table drivers(
  driver_id INT PRIMARY KEY ,
  driver_name VARCHAR(100),
  licence_number VARCHAR(100) UNIQUE
);


create table ride(
    ride_id INT PRIMARY KEY,
    driver_id INT ,
    pickUp_location VARCHAR(100),
    drop_location VARCHAR(100),
    ride_date DATETIME,
    fare DECIMAL(10,2),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);


-- soft delete  using deafult ( we can able to add in both creating and updating the column )

alter table ride ADD COLUMN is_delete boolean default false;

+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | YES  | MUL | NULL    |       |
| pickUp_location | varchar(100)  | YES  |     | NULL    |       |
| drop_location   | varchar(100)  | YES  |     | NULL    |       |
| ride_date       | datetime      | YES  |     | NULL    |       |
| fare            | decimal(10,2) | YES  |     | NULL    |       |
| is_delete       | tinyint(1)    | YES  |     | 0       |       |
+-----------------+---------------+------+-----+---------+-------+

insert into drivers(driver_id,driver_name,licence_number) values
 (11,'deva','auto-deva'),
 (12,'sankar','auto-sankar'),
 (13,'devu','auto-devu'),
 (14,'gomo','auto-gomo');

insert into ride (ride_id, driver_id,pickUp_location,drop_location,ride_date,fare) values 

 (1, 11,'kirumampakkam ','kattukuppam','2025-12-15 08:00:00',10.00),
 (2, 12,'kattukuppam ','kirumampakkam','2025-12-16 08:00:00',10.00),
 (3, 14,'pondy ','cuddalore','2025-12-18 08:00:00',30.00);


alter table ride ADD COLUMN is_delete boolean default false;

update ride set is_delete=true where ride_id=3


+---------+-----------+-----------------+---------------+---------------------+-------+-----------+
| ride_id | driver_id | pickUp_location | drop_location | ride_date           | fare  | is_delete |
+---------+-----------+-----------------+---------------+---------------------+-------+-----------+
|       1 |        11 | kirumampakkam   | kattukuppam   | 2025-12-15 08:00:00 | 10.00 |         0 |
|       2 |        12 | kattukuppam     | kirumampakkam | 2025-12-16 08:00:00 | 10.00 |         0 |
|       3 |        14 | pondy           | cuddalore     | 2025-12-18 08:00:00 | 30.00 |         0 |
+---------+-----------+-----------------+---------------+---------------------+-------+-----------+

update ride set is_delete=true where ride_id=3;

+---------+-----------+-----------------+---------------+---------------------+-------+-----------+
| ride_id | driver_id | pickUp_location | drop_location | ride_date           | fare  | is_delete |
+---------+-----------+-----------------+---------------+---------------------+-------+-----------+
|       1 |        11 | kirumampakkam   | kattukuppam   | 2025-12-15 08:00:00 | 10.00 |         0 |
|       2 |        12 | kattukuppam     | kirumampakkam | 2025-12-16 08:00:00 | 10.00 |         0 |
|       3 |        14 | pondy           | cuddalore     | 2025-12-18 08:00:00 | 30.00 |         1 |
+---------+-----------+-----------------+---------------+---------------------+-------+-----------+


