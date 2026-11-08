-- 1. Revenue by product
SELECT
    p.product_code,
    p.name,
    SUM(s.quantity) AS units_sold,
    ROUND(SUM(s.quantity * s.unit_price), 2) AS revenue
FROM products p
JOIN sales s
    ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_code,
    p.name
ORDER BY revenue DESC;


-- 2. Revenue by category
SELECT
    p.category,
    ROUND(SUM(s.quantity * s.unit_price), 2) AS revenue
FROM products p
JOIN sales s
    ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;


-- 3. Active products with no sales
SELECT
    p.product_code,
    p.name
FROM products p
LEFT JOIN sales s
    ON s.product_id = p.product_id
WHERE p.status = 'active'
GROUP BY
    p.product_id,
    p.product_code,
    p.name
HAVING COUNT(s.sale_id) = 0;


-- 4. Average selling price by product
SELECT
    p.product_code,
    p.name,
    ROUND(AVG(s.unit_price), 2) AS average_selling_price
FROM products p
JOIN sales s
    ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_code,
    p.name
ORDER BY average_selling_price DESC;
