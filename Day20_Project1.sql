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
select 
Format_date('%Y-%m', delivered_at) as Year_month,
sum(sale_price)/count(distinct order_id) as average_order_value,
count(distinct user_id) as distinct_users
from bigquery-public-data.thelook_ecommerce.order_items
where status = 'Complete' and delivered_at between '2019-01-01 00:00:00' and '2022-05-01 00:00:00'
group by 1
order by 1

Insight:
- Có sự tăng giảm không đáng kể giữa các tháng

Bai3
With female_age as 
(
select min(age) as min_age, max(age) as max_age
from bigquery-public-data.thelook_ecommerce.users
Where gender='F' and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
male_age as 
(
select min(age) as min_age, max(age) as max_age
from bigquery-public-data.thelook_ecommerce.users
Where gender='M' and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
young_old_group as 
(
Select t1.first_name, t1.last_name, t1.gender, t1.age
from bigquery-public-data.thelook_ecommerce.users as t1
Join female_age as t2 on t1.age=t2.min_age or t1.age=t2.max_age
Where t1.gender='F'and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
UNION ALL
Select t3.first_name, t3.last_name, t3.gender, t3.age
from bigquery-public-data.thelook_ecommerce.users as t3
Join female_age as t4 on t3.age=t4.min_age or t3.age=t4.max_age
Where t3.gender='M' and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00'
),
age_tag as
(
Select *, 
Case 
     when age in (select min(age) as min_age
     from bigquery-public-data.thelook_ecommerce.users
     Where gender='F' and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00') then 'Youngest'
     when age in (select min(age) as min_age
     from bigquery-public-data.thelook_ecommerce.users
     Where gender='M'and created_at BETWEEN '2019-01-01 00:00:00' AND '2022-05-01 00:00:00') then 'Youngest'
     Else 'Oldest'
END as tag
from young_old_group 
)
Select gender, tag, count(*) as user_count
from age_tag
group by gender, tag
Insight: trong giai đoạn Từ 1/2019-4/2022
Giới tính Female: lớn tuổi nhất là 70 tuổi (525 người người dùng); nhỏ tuổi nhất là 12 tuổi (569 người dùng)
Giới tính Male: lớn tuổi nhất là 70 tuổi (529 người người dùng); nhỏ tuổi nhất là 12 tuổi (546 người dùng)

Bai 4
Select * from 
(With product_profit as
(
Select 
FORMAT_DATE('%Y-%m', t1.delivered_at) as month_year,
t1.product_id as product_id,
t2.name as product_name,
round(sum(t1.sale_price),2) as sales,
round(sum(t2.cost),2) as cost,
round(sum(t1.sale_price)-sum(t2.cost),2)  as profit
from bigquery-public-data.thelook_ecommerce.order_items as t1
Join bigquery-public-data.thelook_ecommerce.products as t2 on t1.product_id=t2.id
Where t1.status='Complete'
Group by month_year, t1.product_id, t2.name
)
Select * ,
dense_rank() OVER ( PARTITION BY month_year ORDER BY month_year,profit) as rank
from product_profit
) as rank_table
Where rank_table.rank<=5
order by rank_table.month_year

Bai 5
Select 
FORMAT_DATE('%Y-%m-%d', O.delivered_at) as dates,
P.category as product_categories,
round(sum(O.sale_price),2) as revenue
from bigquery-public-data.thelook_ecommerce.order_items as O
join bigquery-public-data.thelook_ecommerce.products as P
on P.id = O.product_id
where O.delivered_at between '2022-04-15 00:00:00' and '2022-07-16 00:00:00'
group by dates, product_categories
order by dates
