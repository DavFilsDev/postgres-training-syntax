/*
 Real backend queries
*/

-- Get all products
SELECT * FROM products;

-- Get all orders with users
SELECT * FROM order_summary;

-- Get total price for each order
SELECT * FROM order_total;

-- Get best selling product
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.name
ORDER BY total_sold DESC;

-- Get total price of order ID = 1
SELECT get_order_total(1);
