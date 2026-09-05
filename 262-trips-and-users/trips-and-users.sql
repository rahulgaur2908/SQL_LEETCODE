# Write your MySQL query statement below


SELECT request_at AS Day,
ROUND(SUM(CASE WHEN status = "cancelled_by_driver" OR status = "cancelled_by_client" THEN 1 ELSE 0 END) / COUNT(request_at), 2) AS "Cancellation Rate"

FROM
Trips AS t
JOIN
Users as u
ON
t.client_id = u.users_id
AND
u.banned = "NO"
JOIN
Users as c
ON
t.driver_id = c.users_id
AND
c.banned = "NO"
WHERE
request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY request_at