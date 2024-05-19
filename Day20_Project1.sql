Ad-hoc tasks
Bai1
select 
Format_date('%Y-%m', I.delivered_at) as Year_month,
count(O.order_id) as total_order,
count(distinct O.user_id) as total_user
from bigquery-public-data.thelook_ecommerce.orders as O
join bigquery-public-data.thelook_ecommerce.order_items as I 
on O.order_id=I.order_id
where O.status = 'Complete' and I.delivered_at between '2019-01-01 00:00:00' and '2022-05-01 00:00:00'
group by 1
order by 1
  
Insight: 
- Có sự tăng đều qua các tháng, năm
  
Bai2

