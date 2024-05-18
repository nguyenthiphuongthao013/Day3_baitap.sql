Bai1
select 
extract(year_month from created_at),
count(order_id) as total_order, 
count(distinct user_id) as total_user
from bigquery-public-data.thelook_ecommerce.orders
where created_at between '2019-01-1' and '2022-04-30'
group by 1
order by 1

Bai2

