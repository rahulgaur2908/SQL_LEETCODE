# Write your MySQL query statement below

WITH RECURSIVE
CTE AS (
    SELECT
        employee_id,
        employee_name,
        1 AS LEVEL
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        c.LEVEL + 1 AS LEVEL
    FROM Employees AS e
    JOIN CTE as c
    ON
    e.manager_id = c.employee_id
),
    

CTE1 AS (
    SELECT
        employee_id AS manager_id,
        employee_id,
        salary
    FROM Employees

    UNION ALL

    SELECT
        c1.manager_id,
        e.employee_id,
        e.salary
    FROM CTE1 AS c1
    JOIN Employees AS e
    ON 
    c1.employee_id = e.manager_id
),

CTE2 AS (
    SELECT
        c.manager_id AS employee_id,
        COUNT(*) - 1 AS team_size,
        SUM(c.salary) AS budget
    FROM CTE1 AS c
    GROUP BY 1
)

SELECT 
    c.employee_id,
    c.employee_name,
    c.LEVEL,
    c2.team_size,
    c2.budget
FROM CTE2 AS c2
LEFT JOIN CTE AS c
ON
c.employee_id = c2.employee_id
ORDER BY 3, 5 DESC, 2