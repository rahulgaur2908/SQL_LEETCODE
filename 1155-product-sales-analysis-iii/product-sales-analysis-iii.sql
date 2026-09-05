# Write your MySQL query statement below

SELECT product_id, YEAR AS first_year, quantity, price

FROM sales
WHERE(product_id, year) IN (SELECT product_id, MIN(YEAR) FROM Sales GROUP BY product_id)
