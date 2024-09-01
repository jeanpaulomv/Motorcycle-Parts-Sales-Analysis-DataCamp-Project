-- Start coding
SELECT 	
	product_line,
	CASE 
		WHEN EXTRACT(MONTH FROM date::timestamp) = 6 THEN 'June'
		WHEN EXTRACT(MONTH FROM date::timestamp) = 7 THEN 'July'
		WHEN EXTRACT(MONTH FROM date::timestamp) = 8 THEN 'August'
	END AS month,
	warehouse,
	ROUND(SUM(total) - SUM(payment_fee), 2) AS net_revenue
FROM 
	sales
WHERE 
	client_type = 'Wholesale'
GROUP BY 
	product_line, 
	month, 
	warehouse
ORDER BY 
	product_line, 
	month, 
	net_revenue DESC;