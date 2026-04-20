# Write your MySQL query statement below
SELECT *
FROM Cinema
WHERE description != 'boring' AND MOD(ID,2) = 1
ORDER BY rating DESC 