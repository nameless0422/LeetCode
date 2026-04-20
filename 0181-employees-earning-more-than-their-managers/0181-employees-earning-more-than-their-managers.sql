# Write your MySQL query statement below
SELECT A.name AS Employee 
FROM Employee A LEFT JOIN Employee B ON A.managerId = B.Id  
WHERE B.salary < A.salary