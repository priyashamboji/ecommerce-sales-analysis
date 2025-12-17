KPI 1: Total Orders
SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset;


KPI 2: Total Revenue
SELECT ROUND(SUM(payment_value), 2) AS total_revenue
FROM olist_order_payments_dataset;


KPI 3: Revenue by Payment Type
SELECT payment_type,
       ROUND(SUM(payment_value), 2) AS revenue
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY revenue DESC;


KPI 4: Orders by Status
SELECT order_status,
       COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status;


KPI 5: Top 10 Product Categories by Revenue
SELECT 
    t.product_category_name_english AS category,
    ROUND(SUM(oi.price), 2) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
    ON oi.product_id = p.product_id
JOIN product_category_name_translation t
    ON p.product_category_name = t.`ï»¿product_category_name`
GROUP BY t.product_category_name_english
ORDER BY revenue DESC
LIMIT 10;
