Bai1
select Name from STUDENTS
where marks>75
order by right(Name,3) , ID
Bai2
select user_id,
concat(upper(left(name,1)), lower(right(name, length(name)-1))) as name
from Users
order by user_id
Bai3
SELECT manufacturer,
'$'||ROUND(SUM(total_sales)/1000000)||' '||'million' as total_sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY total_sales DESC, manufacturer
Bai4
SELECT
EXTRACT(month from submit_date) as mth,
product_id,
ROUND(AVG(stars),2) as avg_stars
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id
Bai5
SELECT
sender_id,
count(content) as message_count
FROM messages
WHERE EXTRACT(month from sent_date) = 08 AND
EXTRACT(year from sent_date) = 2022
GROUP BY sender_id
ORDER BY message_count DESC
limit 2
Bai6
select tweet_id from Tweets
where length(content)>15
Bai7

Bai8
select
count(id) as  employees
from employees
where extract(month from joining_date) between 01 and 07
and extract(year from joining_date) = 2022
Bai9
select 
POSITION('a' in first_name)
from worker
where first_name = 'Amitah'
Bai10
select
substring(title,length(winery)+2, 4)
from winemag_p2
where country = 'Macedonia'
