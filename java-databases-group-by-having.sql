--- Java- Databases: Group By & Having
	

--  1. Select all orders that have total price greater than 300.
	SELECT order_id, SUM(unit_price * quantity)  as order_total FROM order_details
	GROUP BY order_id
	HAVING (SUM(unit_price * quantity) > 300)
	ORDER BY order_id;

--  2. Select only employees that have more than 100 orders.
	SELECT e.employee_id, e.first_name, e.last_name, FROM employees as e
	JOIN orders ON orders.employee_id = e.employee_id
	JOIN order_details ON order_details.order_id = orders.order_id
	GROUP BY e.employee_id
	HAVING (SELECT * FROM order_details );

--  3. Select the latest order (order_id, customer_id, order_date) for each customer. Include only orders that were made after 1998-05-05.
	SELECT order_id, customer_id, order_date FROM orders
	WHERE order_date > '1998-05-05'
	GROUP BY order_id
	ORDER BY order_date DESC;

--  4. Select shipper company name and calculate how many orders have each.

--  5. Select the most expensive order.

--  6. Select an order that have the most items in it.

--  7. Select orders that was shipped by company with id = 1 and contains more than 4 items.

--  8. Select category id, category name and sumarize quantity of products for each category. Take into consideratation only categories with id: 1,2,3 and list only those where sum of products is bigger than 6000.

--  9. Make a report on the 10 best selling products with categories in 1997.

-- 10. Select the least popular categories of products for orders made in 1997.
