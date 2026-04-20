# Write your MySQL query statement below
SELECT A.name AS Employee
FROM Employee A JOIN Employee B ON A.managerId = B.id
WHERE A.salary > B.salary;