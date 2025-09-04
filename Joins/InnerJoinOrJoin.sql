/*

📌 Why JOIN?
We use JOIN when data is split across multiple tables, and we need to combine related information.

Example:

Customers table → stores customer details.
Orders table → stores orders placed by customers.

👉 To know which customer placed which order, we must combine both tables. That’s where JOIN comes in.

📌 INNER JOIN
Returns only the rows where there is a match in both tables.
If a customer has no order → they won’t appear in the result.
*/

CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    hotel_id INT,
    item VARCHAR(100),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);


INSERT INTO Hotels (hotel_id, hotel_name, city) VALUES
(1, 'Grand Palace', 'Delhi'),
(2, 'Sea View', 'Chennai'),
(3, 'Mountain Nest', 'Manali');

INSERT INTO Orders (order_id, hotel_id, item) VALUES
(101, 1, 'Biryani'),
(102, 2, 'Dosa'),
(103, 1, 'Paneer Tikka');


/*
Q1. Write a SQL query to list all orders with the hotel name and city where the order was placed.
    Expected : hotel_name, city, order_id, item
*/


SELECT 
    h.hotel_name,
    h.city,
    o.order_id,
    o.item
FROM 
    Hotels h
INNER JOIN 
    Orders o
    ON o.hotel_id = h.hotel_id;




