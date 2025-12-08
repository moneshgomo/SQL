-- where ( FILTER CONDITION )
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

-- insert sample data into rides table
insert into rides (ride_id, driver_id, rider_id, pickUp_location, drop_location, ride_date, fare) values
(1, 101, 201, 'Location A', 'Location B', '2024-01-10 10:00:00', 15.50),
(2, 102, 202, 'Location C', 'Location D', '2024-01-11 12:30:00', 22.75),
(3, 103, 203, 'Location E', 'Location F', '2024-01-12 14:45:00', 18.00),
(4, 104, 204, 'Location G', 'Location H', '2024-01-13 16:20:00', 30.00),
(5, 105, 205, 'Location I', 'Location J', '2024-01-14 18:15:00', 25.50);

-- select rides with fare greater than 20 ( ascending order ( default ) )
select * from rides where fare > 20 ORDER BY fare;
-- select rides with fare greater than 20 ( descending order )
select * from rides where fare > 20 ORDER BY fare DESC;

-- select rides with two conditions ( fare greater than 20 and ride location is 'Location C' )
select * from rides where fare > 20 AND pickUp_location = 'Location C';