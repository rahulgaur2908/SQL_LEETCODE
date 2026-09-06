# Write your MySQL query statement below

SELECT employee_id, name, 
        RIGHT(q, 1) - LEFT(q, 1) improvement_score
FROM (
    SELECT employee_id, name, 
        RIGHT(GROUP_CONCAT(rating ORDER BY review_date), 5) q
    FROM employees
    JOIN
    performance_reviews 
    USING (employee_id)
    GROUP BY employee_id, name
    HAVING length(q) = 5 
    AND LEFT(q, 1) < SUBSTRING(q, 3, 1) AND SUBSTRING(q, 3, 1) < RIGHT(q, 1)
) AS t

ORDER BY improvement_score DESC, name