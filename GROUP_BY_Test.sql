
CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    restaurant_name VARCHAR(50),
    city VARCHAR(50),
    food_category VARCHAR(30),
    amount DECIMAL(10,2),
    quantity INT,
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    order_date DATE
);

INSERT INTO food_orders VALUES
(1, 'Arun', 'A2B', 'Chennai', 'South Indian', 250, 2, 'UPI', 'Delivered', '2026-01-01'),
(2, 'Priya', 'KFC', 'Chennai', 'Fast Food', 450, 3, 'Card', 'Delivered', '2026-01-01'),
(3, 'Rahul', 'Dominos', 'Bangalore', 'Pizza', 600, 2, 'UPI', 'Delivered', '2026-01-02'),
(4, 'Kumar', 'A2B', 'Chennai', 'South Indian', 180, 1, 'Cash', 'Cancelled', '2026-01-02'),
(5, 'Divya', 'Burger King', 'Hyderabad', 'Fast Food', 350, 2, 'UPI', 'Delivered', '2026-01-03'),

(6, 'Arun', 'KFC', 'Chennai', 'Fast Food', 500, 4, 'Card', 'Delivered', '2026-01-03'),
(7, 'Priya', 'A2B', 'Chennai', 'South Indian', 220, 2, 'UPI', 'Delivered', '2026-01-04'),
(8, 'Rahul', 'Dominos', 'Bangalore', 'Pizza', 750, 3, 'Card', 'Cancelled', '2026-01-04'),
(9, 'Kumar', 'KFC', 'Chennai', 'Fast Food', 400, 2, 'Cash', 'Delivered', '2026-01-05'),
(10, 'Divya', 'Burger King', 'Hyderabad', 'Fast Food', 300, 2, 'UPI', 'Delivered', '2026-01-05'),

(11, 'Arun', 'A2B', 'Chennai', 'South Indian', 150, 1, 'UPI', 'Delivered', '2026-01-06'),
(12, 'Priya', 'Dominos', 'Chennai', 'Pizza', 550, 2, 'Card', 'Delivered', '2026-01-06'),
(13, 'Rahul', 'KFC', 'Bangalore', 'Fast Food', 480, 3, 'UPI', 'Delivered', '2026-01-07'),
(14, 'Kumar', 'A2B', 'Chennai', 'South Indian', 200, 2, 'Cash', 'Cancelled', '2026-01-07'),
(15, 'Divya', 'Dominos', 'Hyderabad', 'Pizza', 650, 2, 'Card', 'Delivered', '2026-01-08'),

(16, 'Arun', 'Burger King', 'Chennai', 'Fast Food', 320, 2, 'UPI', 'Delivered', '2026-01-08'),
(17, 'Priya', 'KFC', 'Chennai', 'Fast Food', 420, 3, 'Cash', 'Delivered', '2026-01-09'),
(18, 'Rahul', 'A2B', 'Bangalore', 'South Indian', 280, 2, 'UPI', 'Cancelled', '2026-01-09'),
(19, 'Kumar', 'Dominos', 'Chennai', 'Pizza', 700, 3, 'Card', 'Delivered', '2026-01-10'),
(20, 'Divya', 'KFC', 'Hyderabad', 'Fast Food', 390, 2, 'UPI', 'Delivered', '2026-01-10'),

(21, 'Arun', 'Dominos', 'Chennai', 'Pizza', 580, 2, 'Card', 'Delivered', '2026-01-11'),
(22, 'Priya', 'Burger King', 'Chennai', 'Fast Food', 270, 1, 'UPI', 'Cancelled', '2026-01-11'),
(23, 'Rahul', 'KFC', 'Bangalore', 'Fast Food', 520, 3, 'Cash', 'Delivered', '2026-01-12'),
(24, 'Kumar', 'A2B', 'Chennai', 'South Indian', 190, 1, 'UPI', 'Delivered', '2026-01-12'),
(25, 'Divya', 'Dominos', 'Hyderabad', 'Pizza', 720, 3, 'Card', 'Delivered', '2026-01-13'),

(26, 'Arun', 'KFC', 'Chennai', 'Fast Food', 460, 3, 'UPI', 'Delivered', '2026-01-13'),
(27, 'Priya', 'A2B', 'Chennai', 'South Indian', 210, 2, 'Cash', 'Delivered', '2026-01-14'),
(28, 'Rahul', 'Burger King', 'Bangalore', 'Fast Food', 340, 2, 'UPI', 'Delivered', '2026-01-14'),
(29, 'Kumar', 'Dominos', 'Chennai', 'Pizza', 680, 3, 'Card', 'Cancelled', '2026-01-15'),
(30, 'Divya', 'A2B', 'Hyderabad', 'South Indian', 240, 2, 'UPI', 'Delivered', '2026-01-15');





INSERT INTO food_orders VALUES
(31, 'Arun', 'KFC', 'Chennai', 'Fast Food', 450, 2, 'UPI', 'Delivered', '2026-01-16'),
(32, 'Arun', 'A2B', 'Chennai', 'South Indian', 200, 2, 'Cash', 'Delivered', '2026-01-16'),
(33, 'Arun', 'Dominos', 'Chennai', 'Pizza', 650, 3, 'Card', 'Delivered', '2026-01-17'),

(34, 'Priya', 'KFC', 'Chennai', 'Fast Food', 380, 2, 'UPI', 'Delivered', '2026-01-17'),
(35, 'Priya', 'A2B', 'Chennai', 'South Indian', 190, 1, 'Cash', 'Cancelled', '2026-01-18'),

(36, 'Rahul', 'Dominos', 'Bangalore', 'Pizza', 720, 3, 'Card', 'Delivered', '2026-01-18'),

(37, 'Arun', 'Burger King', 'Chennai', 'Fast Food', 320, 2, 'UPI', 'Delivered', '2026-01-19'),

(38, 'Meena', 'A2B', 'Chennai', 'South Indian', 180, 1, 'UPI', 'Delivered', '2026-01-19'),
(39, 'Meena', 'KFC', 'Chennai', 'Fast Food', 420, 2, 'Card', 'Delivered', '2026-01-20'),
(40, 'Sanjay', 'Dominos', 'Bangalore', 'Pizza', 550, 2, 'UPI', 'Delivered', '2026-01-20');


-- select * from food_orders ;


-- select DISTINCT food_category from food_orders;
-- select food_category , count(food_category) from food_orders GROUP BY food_category;

-- select city , count(order_id) as total_orders  from food_orders GROUP BY city;




-- select restaurant_name , sum(amount) as total_revenue from food_orders GROUP BY 
-- restaurant_name  ORDER BY total_revenue DESC;


-- select city , Round(avg(amount),2) as avg_amount from food_orders GROUP BY city ORDER BY avg_amount DESC;


-- select restaurant_name ,MAX(amount) as highest_order from food_orders 
-- GROUP BY restaurant_name ORDER BY  highest_order DESC ;

-- select food_category ,MIN(amount) as lowest_order from food_orders 
-- GROUP BY food_category ORDER BY  lowest_order ASC ;


-- select payment_method , count(order_status) as delivered_orders  from food_orders HAVING  order_status = 'Delivered'
--  GROUP BY payment_method ORDER BY delivered_orders DESC ;



--  select customer_name , count(order_status) as total_orders from food_orders 
--  GROUP BY customer_name  
--  HAVING count(order_status) > 5 ORDER BY total_orders DESC;

-- select * from food_orders limit 1;

-- select restaurant_name , SUM(amount) as total_revenue from food_orders where order_status = 'Delivered' GROUP BY restaurant_name  HAVING SUM(amount) > 2000 ORDER BY total_revenue DESC;

-- select city , payment_method , count(order_status) as total_orders  from food_orders
-- GROUP BY city , payment_method ORDER BY city , total_orders DESC;

-- select food_category , count(order_status) as total_orders , SUM(amount) as total_amount from food_orders
-- GROUP BY food_category  ORDER BY  total_amount DESC;



-- select city , ROUND(AVG(amount),2) as avg_amount from food_orders  
-- where order_status = 'Delivered'  GROUP BY city   
-- HAVING ROUND(AVG(amount),2) > 400 ORDER BY avg_amount DESC;

-- select  restaurant_name , count(DISTINCT customer_name) as unique_customers from food_orders 
-- GROUP BY restaurant_name ORDER BY unique_customers DESC;
-- select count(*) from food_orders where restaurant_name = 'KFC' AND order_status = 'Delivered';

-- select restaurant_name , count(*) as delivered_orders ,SUM(amount) as total_revenue
-- from food_orders where order_status = 'Delivered' 
-- GROUP BY restaurant_name HAVING count(*) >= 5 ORDER BY total_revenue DESC;



-- select customer_name , count(order_status) as total_orders , SUM(amount) as total_spent
-- from food_orders 
-- GROUP BY customer_name 
-- HAVING sum(amount) > 2500  AND  count(order_status) >= 5 ORDER BY total_spent DESC;


-- select order_date , count(*) as total_orders , SUM(amount) as total_amount from food_orders
-- GROUP BY order_date 
-- HAVING count(*) > 1
-- ORDER BY order_date ASC;


-- select restaurant_name , count(*) FILTER (where order_status = 'Delivered' ) as delivered_orders , count(*) FILTER (WHERE order_status = 'Cancelled') as cancelled_orders
-- from food_orders
-- GROUP BY restaurant_name 
-- ORDER BY delivered_orders DESC;

-- select city ,  SUM(amount) FILTER (where order_status = 'Delivered' ) as delivered_revenue , SUM(amount) FILTER (WHERE order_status = 'Cancelled') as cancelled_amount
-- from food_orders 
-- GROUP BY city 
-- ORDER BY delivered_revenue DESC;


-- select customer_name , count(DISTINCT restaurant_name) as restaurant_count
-- from food_orders
-- GROUP BY customer_name HAVING count(DISTINCT restaurant_name) >= 3
-- ORDER BY restaurant_count DESC;


-- select restaurant_name , count(order_status)  as delivered_orders  , ROUND(avg(amount),2) as avg_order_amount
-- FROM food_orders  
-- WHERE order_status = 'Delivered'
-- GROUP BY restaurant_name
-- HAVING count(order_status) >= 5 AND ROUND(AVG(amount),2) > 400
-- order by avg_order_amount desc;

select * from food_orders limit 5;

select  city , payment_method , count(order_status) , count(order_status) as total_orders ,  sum(amount)  as total_amount
from food_orders
WHERE order_status = 'Delivered'
GROUP by city , payment_method 
HAVING sum(amount) > 1000  AND count(order_status) >= 3
ORDER BY city ,   total_amount DESC
;
