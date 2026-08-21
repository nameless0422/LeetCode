# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from (
    SELECT 
        num,
        lead(num, 1) over (order by id) as next_num,
        lead(num, 2) over (order by id) as next_next_num
    FROM Logs
) as subq
where num = next_num and num = next_next_num;