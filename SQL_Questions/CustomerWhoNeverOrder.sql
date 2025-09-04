/*
📌 Problem Restatement

We have two tables:

Customers(id, name) → list of all customers

Orders(id, customerId) → list of all placed orders

We need to find customers who never placed an order.

📌 Thought Process

Every customer has a unique id.

The Orders table connects orders to customers using customerId.

If a customer’s id is not present in Orders.customerId, that means the customer never ordered.

We can solve this using:

LEFT JOIN with NULL check

NOT IN subquery

NOT EXISTS subquery

*/

