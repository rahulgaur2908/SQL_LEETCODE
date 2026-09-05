# Write your MySQL query statement below

SELECT id,
        SUM(IF(MONTH = "Jan", revenue, NULL)) AS Jan_Revenue,
        SUM(IF(MONTH = "Feb", revenue, NULL)) AS Feb_Revenue,
        SUM(IF(MONTH = "Mar", revenue, NULL)) AS Mar_Revenue,
        SUM(IF(MONTH = "Apr", revenue, NULL)) AS Apr_Revenue,
        SUM(IF(MONTH = "May", revenue, NULL)) AS May_Revenue,
        SUM(IF(MONTH = "Jun", revenue, NULL)) AS Jun_Revenue,
        SUM(IF(MONTH = "Jul", revenue, NULL)) AS Jul_Revenue,
        SUM(IF(MONTH = "Aug", revenue, NULL)) AS Aug_Revenue,
        SUM(IF(MONTH = "Sep", revenue, NULL)) AS Sep_Revenue,
        SUM(IF(MONTH = "Oct", revenue, NULL)) AS Oct_Revenue,
        SUM(IF(MONTH = "Nov", revenue, NULL)) AS Nov_Revenue,
        SUM(IF(MONTH = "Dec", revenue, NULL)) AS Dec_Revenue

FROM Department
GROUP BY id
        