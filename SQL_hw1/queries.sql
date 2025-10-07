use customers;

-- The query below returns the TOP 3 customers by total spending (over 500),
-- along with their order stats, average product price, average rating,
-- total number of ordered items and list of product categories they bought.

WITH customer_stats AS (
--  CTE: calculates for each customer
--  the total number of orders (total_orders)
--  the total amount spent (total_spent)
-- Joins the Customers and Orders tables and groups the results by customer.
    SELECT 
        c.customer_id,
        c.name,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(o.total_amount) AS total_spent
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.name
),
customer_avg_price AS (
-- calculates the average price of products 
-- each customer has purchased. Joins Orders, Order_Items, and Products 
-- tables, then groups by customer.
    SELECT 
        o.customer_id,
        AVG(p.price) AS avg_product_price
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id
)
-- Select top 3 customers who spent more than 500 in total.
-- Show their basic info, average product price, average rating,
-- total number of items ordered, and the categories they bought from.
SELECT 
    cs.customer_id,
    cs.name AS customer_name,
    cs.total_orders,
    cs.total_spent,
    cap.avg_product_price,
    AVG(r.rating) AS avg_rating,
    COUNT(DISTINCT oi.order_item_id) AS total_items_ordered,
    GROUP_CONCAT(DISTINCT c.category_name) AS categories_ordered
FROM customer_stats cs
JOIN Orders o ON cs.customer_id = o.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
JOIN customer_avg_price cap ON cs.customer_id = cap.customer_id
LEFT JOIN Reviews r ON r.product_id = p.product_id AND r.customer_id = cs.customer_id	 --  LEFT JOIN for reviews to include customers without ratings too
WHERE cs.total_spent > 500		-- use where to filter only customers who spent more than 500
GROUP BY 			 -- for grouping data per customer
    cs.customer_id, 
    cs.name, 
    cs.total_orders, 
    cs.total_spent, 
    cap.avg_product_price
HAVING COUNT(oi.order_item_id) >= 1     -- Customers who ordered at least 1 item
ORDER BY cs.total_spent DESC			-- Sort by money spent (highest first)
LIMIT 3;								-- Show top 3 customers
