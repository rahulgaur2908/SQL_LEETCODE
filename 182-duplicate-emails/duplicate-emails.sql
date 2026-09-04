# Write your MySQL query statement below

SELECT email
FROM 
Person AS p
GROUP BY email
HAVING COUNT(email) > 1;
