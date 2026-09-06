# Write your MySQL query statement below

SELECT 
p1.product_id AS product1_id,
p2.product_id AS product2_id,
pi1.category AS product1_category,
pi2.category AS product2_category,
COUNT(p1.user_id) AS customer_count
FROM
ProductPurchases AS p1
INNER JOIN
ProductPurchases AS p2
ON
p1.user_id = p2.user_id AND p1.product_id < p2.product_id
LEFT JOIN
ProductInfo AS pi1
ON
p1.product_id = pi1.product_id
LEFT JOIN
ProductInfo AS pi2
ON p2.product_id = pi2.product_id
GROUP BY product1_id, product2_id
HAVING COUNT(p1.user_id) >= 3
ORDER BY customer_count DESC, product1_id, product2_id