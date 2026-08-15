# Write your MySQL query statement below
select request_at Day, round(avg(status != 1), 2) 'Cancellation Rate'
from Trips
where request_at between '2013-10-01' and '2013-10-03'
  and not exists (select 1 from Users where banned = 'Yes' and users_id in (client_id, driver_id))
group by 1