--- Java- Databases: Group By & Having
	

--  1. Select all orders that have total price greater than 300.
	SELECT order_id, SUM(unit_price * quantity)  as order_total FROM order_details
	GROUP BY order_id
	HAVING (SUM(unit_price * quantity) > 300)
	ORDER BY order_id;

--  2. Select only employees that have more than 100 orders.
	SELECT e.employee_id, first_name, e.last_name, COUNT(orders.order_id) as order_count FROM employees AS e
	RIGHT JOIN orders on e.employee_id = orders.employee_id
	GROUP BY e.employee_id
	HAVING COUNT(orders.order_id) > 100
	ORDER BY order_count DESC;

--  3. Select the latest order (order_id, customer_id, order_date) for each customer. Include only orders that were made after 1998-05-05.
	SELECT order_id, customer_id, order_date FROM orders
	WHERE order_date > '1998-05-05'
	GROUP BY order_id
	ORDER BY order_date DESC;

--  4. Select shipper company name and calculate how many orders have each.
	SELECT s.shipper_id, s.company_name, COUNT(o.order_id) FROM shippers AS s
	JOIN orders AS o ON s.shipper_id = o.ship_via
	GROUP BY s.shipper_id;

--  5. Select the most expensive order.
	SELECT o.customer_id, order_details.order_id, SUM(order_details.quantity * order_details.unit_price - order_details.discount) as order_total FROM order_details
	JOIN orders AS o ON order_details.order_id = o.order_id
	GROUP BY order_details.order_id, o.customer_id
	ORDER BY order_total;

--  6. Select an order that have the most items in it.
	SELECT od.order_id, o.customer_id, sum(quantity) AS quantity FROM order_details AS od
	JOIN orders as o ON o.order_id = od.order_id
	GROUP BY od.order_id, o.customer_id
	ORDER BY quantity DESC
	LIMIT 1;

--  7. Select orders that was shipped by company with id = 1 and contains more than 4 items.
	SELECT od.order_id, SUM(od.quantity) as quantity FROM order_details as od
	JOIN orders AS o ON o.order_id = od.order_id
	JOIN shippers AS s ON s.shipper_id = o.ship_via
	GROUP By od.order_id, s.shipper_id
	HAVING SUM(od.quantity) > 4
	ORDER BY quantity DESC;

--  8. Select category id, category name and sumarize quantity of products for each category. Take into consideratation only categories with id: 1,2,3 and list only those where sum of products is bigger than 6000.
	SELECT c.category_id, c.category_name, SUM(p.units_in_stock) FROM categories AS c
	JOIN products AS p ON p.category_id = c.category_id
	GROUP BY c.category_id
	ORDER BY c.category_name;

--  9. Make a report on the 10 best selling products with categories in 1997.

-- 10. Select the least popular categories of products for orders made in 1997.
