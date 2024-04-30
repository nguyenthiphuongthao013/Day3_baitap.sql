Bai1
SELECT
SUM(
CASE 
 WHEN device_type = 'laptop' then 1 else 0
 END) as laptop_views,
sum(
CASE
when device_type IN ('tablet','phone') then 1 else 0
end)as mobile_views
FROM viewership
Bai2
select x,y,z,
case
when abs((x-y))<z and z<(x+y) then 'Yes'
else 'No'
end as triangle
from Triangle
Bai3
SELECT 
100*SUM(CASE
when call_category = 'n/a' then 1 else 0 end )/COUNT(call_category)
From callers
Bai4
select name
from Customer
where referee_id is Null or referee_id <>2
Bai5
select survived,
sum(case
when pclass=1 then 1 else 0 end) as first_class,
sum(case
when pclass=2 then 1 else 0 end) as secon_class,
sum (case
when pclass=3 then 1 else 0 end) as third_class
from titanic
group by survived
