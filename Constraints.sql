/*
Set the rule for the columns 
    PK
    FF
    NOT NULL
	Composite primary key { more than one combination of PK  }

PRIMARY KEY  { only unique values }

*/


create table uber.rides (
	ride_id INT PRIMARY KEY ,
	driver_id INT ,
	rideer_id INT ,
	pickup_location VARCHAR (100),
	drop_location VARCHAR (100),
	ride_date DATETIME,
	fare DECIMAL (10,2)
);


INSERT INTO uber.rides (ride_id, driver_id, rideer_id, pickup_location, drop_location, ride_date, fare) VALUES
(1, 101, 201, 'T Nagar', 'Marina Beach', '2025-08-01 10:30:00', 120.50),
(2, 102, 202, 'Velachery', 'Guindy', '2025-08-02 15:45:00', 90.00),
(3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', 110.75),
(4, 104, 204, 'Adyar', 'Guindy Industrial Estate', '2025-08-04 12:00:00', 130.00),
(5, 105, 205, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20);

select * from rides;


drop table rides;


// composite key

create table uber.rides (
	ride_id INT  ,
	driver_id INT ,
	rider_id INT ,
	pickup_location VARCHAR (100),
	drop_location VARCHAR (100),
	ride_date DATETIME,
	fare DECIMAL (10,2),
	primary key (ride_id,rider_id)
);

mysql> desc rides;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | YES  |     | NULL    |       |
| rider_id        | int           | NO   | PRI | NULL    |       |
| pickup_location | varchar(100)  | YES  |     | NULL    |       |
| drop_location   | varchar(100)  | YES  |     | NULL    |       |
| ride_date       | datetime      | YES  |     | NULL    |       |
| fare            | decimal(10,2) | YES  |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+

INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(1, 101, 201, 'T Nagar', 'Marina Beach', '2025-08-01 10:30:00', 120.50),
(2, 102, 202, 'Velachery', 'Guindy', '2025-08-02 15:45:00', 90.00),
(3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', 110.75),
(4, 104, 204, 'Adyar', 'Guindy Industrial Estate', '2025-08-04 12:00:00', 130.00),
(5, 105, 205, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20);

/*

when we have the composite primary key we can able to add the 

duplicate value like see the below example 


existig data inserted in the table 

INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(5, 105, 205, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20);

*/

INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(5, 105, 206, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20);


mysql> select * from rides;
+---------+-----------+----------+-----------------+--------------------------+---------------------+--------+
| ride_id | driver_id | rider_id | pickup_location | drop_location            | ride_date           | fare   |
+---------+-----------+----------+-----------------+--------------------------+---------------------+--------+
|       1 |       101 |      201 | T Nagar         | Marina Beach             | 2025-08-01 10:30:00 | 120.50 |
|       2 |       102 |      202 | Velachery       | Guindy                   | 2025-08-02 15:45:00 |  90.00 |
|       3 |       103 |      203 | Anna Nagar      | Chennai Central          | 2025-08-03 09:15:00 | 110.75 |
|       4 |       104 |      204 | Adyar           | Guindy Industrial Estate | 2025-08-04 12:00:00 | 130.00 |
|       5 |       105 |      205 | Kodambakkam     | Vadapalani               | 2025-08-05 18:30:00 |  80.20 |
|       5 |       105 |      206 | Kodambakkam     | Vadapalani               | 2025-08-05 18:30:00 |  80.20 |
+---------+-----------+----------+-----------------+--------------------------+---------------------+--------+

/*
See here the last two rows ride_id are same but the rider_id are different 

{ But the PRIMARY KEY allow only the unique values } but here no conflict 
{ how } => why because the combination of ride_id and rider_id are act as a single key for the row 

if we run again the query , we get ERROR [i.e] given below 

*/

mysql> (5, 105, 206, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5, 105, 206, 'Kodambakkam', 'Vadapalani', '2025-08-05 18:30:00', 80.20)' at line 1
mysql>


----


create table uber.users(
	user_is int PRIMARY KEY,
	email VARCHAR (100) UNIQUE
);


ALTER TABLE uber.users RENAME COLUMN user_is TO user_id;

INSERT INTO uber.users (user_id, email) VALUES
(1, 'arun.kumar@example.com'),
(2, 'meena.r@example.com'),
(3, 'vignesh.s@example.com'),
(4, 'priya.d@example.com'),
(5, 'karthik.r@example.com');


/* UNIQUE contraints allow { NULL, n no. of NULL  and no DUPLICATE } values but PRIMARY KEY not NULL  */

/* NOT NULL */

drop table rides;


create table uber.rides (
	ride_id INT PRIMARY KEY ,
	driver_id INT NOT NULL ,
	rider_id INT NOT NULL ,
	pickup_location VARCHAR (100) NOT NULL,
	drop_location VARCHAR (100) NOT NULL,
	ride_date DATETIME NOT NULL,
	fare DECIMAL (10,2) NOT NULL 
);

mysql> desc rides;
+-----------------+---------------+------+-----+---------+-------+
| Field           | Type          | Null | Key | Default | Extra |
+-----------------+---------------+------+-----+---------+-------+
| ride_id         | int           | NO   | PRI | NULL    |       |
| driver_id       | int           | NO   |     | NULL    |       |
| rider_id        | int           | NO   |     | NULL    |       |
| pickup_location | varchar(100)  | NO   |     | NULL    |       |
| drop_location   | varchar(100)  | NO   |     | NULL    |       |
| ride_date       | datetime      | NO   |     | NULL    |       |
| fare            | decimal(10,2) | NO   |     | NULL    |       |
+-----------------+---------------+------+-----+---------+-------+


INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(1, 101, 201, 'T Nagar', 'Marina Beach', '2025-08-01 10:30:00', 120.50),
(2, 102, 202, 'Velachery', 'Guindy', '2025-08-02 15:45:00', 90.00);


// ERROR EXAMPLE 
INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(2, 102, 202, NULL, 'Guindy', '2025-08-02 15:45:00', 90.00);

mysql> INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
    -> (2, 102, 202, NULL, 'Guindy', '2025-08-02 15:45:00', 90.00);
ERROR 1048 (23000): Column 'pickup_location' cannot be null



--  CHECK 


drop table rides;

create table uber.rides (
	ride_id INT PRIMARY KEY ,
	driver_id INT NOT NULL ,
	rider_id INT NOT NULL ,
	pickup_location VARCHAR (100) NOT NULL,
	drop_location VARCHAR (100) NOT NULL,
	ride_date DATETIME NOT NULL,
	fare DECIMAL (10,2) CHECK ( fare > 0)
);

--  fare must be always greater than zero 

-- ✅ Two rows with fare > 0

INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(1, 101, 201, 'T Nagar', 'Marina Beach', '2025-08-01 10:30:00', 120.50),
(2, 102, 202, 'Velachery', 'Guindy', '2025-08-02 15:45:00', 90.00);


mysql> select * from uber.rides;
+---------+-----------+----------+-----------------+---------------+---------------------+--------+
| ride_id | driver_id | rider_id | pickup_location | drop_location | ride_date           | fare   |
+---------+-----------+----------+-----------------+---------------+---------------------+--------+
|       1 |       101 |      201 | T Nagar         | Marina Beach  | 2025-08-01 10:30:00 | 120.50 |
|       2 |       102 |      202 | Velachery       | Guindy        | 2025-08-02 15:45:00 |  90.00 |
+---------+-----------+----------+-----------------+---------------+---------------------+--------+

-- ❌ This will fail because fare = 0 violates CHECK (fare > 0)

INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', 0.00);


mysql> INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
    -> (3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', 0.00);
ERROR 3819 (HY000): Check constraint 'rides_chk_1' is violated.



INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
(3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', -100.00);

mysql> INSERT INTO uber.rides (ride_id, driver_id, rider_id, pickup_location, drop_location, ride_date, fare) VALUES
    -> (3, 103, 203, 'Anna Nagar', 'Chennai Central', '2025-08-03 09:15:00', -100.00);




