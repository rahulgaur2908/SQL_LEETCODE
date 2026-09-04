# Write your MySQL query statement below

SELECT *
FROM
Cinema
WHERE id %2 != 0
AND
Description != "Boring"
ORDER BY rating DESC