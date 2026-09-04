# Write your MySQL query statement below

SELECT today.Id FROM Weather AS today
WHERE EXISTS

   ( SELECT 1 FROM Weather AS yesterday
     WHERE yesterday.temperature < today.temperature
     AND 
     DATEDIFF(today.recordDate, yesterday.recordDate) = 1 )   