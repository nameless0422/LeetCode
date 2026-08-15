# Write your MySQL query statement below
select request_at as Day, round((sum(case when status like 'cancelled%' then 1 else 0 end)/count(*)),2) as 'Cancellation Rate'
from Trips T 
join Users C on T.client_id = C.users_id and C.banned ='No'
join Users D on T.driver_id = D.users_id and D.banned ='No'
where T.request_at between '2013-10-01' and '2013-10-03'
group by T.request_at