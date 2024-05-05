Bai1
WITH CTE AS
(SELECT
company_id, title, description, COUNT(*) AS TIME
FROM job_listings
GROUP BY company_id, title, description
)
SELECT COUNT(company_id) FROM CTE
WHERE TIME >1
Bai2
WITH CTE AS (SELECT * FROM product_spend
WHERE transaction_date BETWEEN '01/01/2022' AND '12/31/2022')
SELECT 
category,
product,
SUM(spend) as total
FROM CTE
GROUP BY category,product
ORDER BY SUM(spend) DESC
Bai3
SELECT COUNT(CALL) AS policy_holder_count
FROM(
SELECT policy_holder_id, 
COUNT(case_id) AS CALL
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id)>=3) AS A  
Bai4
SELECT
P.page_id
FROM
pages as P
LEFT JOIN
page_likes as L
ON P.page_id=L.page_id
WHERE L.user_id is NULL
ORDER BY page_id
Bai5
select extract(month from event_date) as month, 
count(distinct user_id) as monthly_active_users
from user_actions
where user_id in 
(select
distinct user_id
from user_actions
where event_type in ('sign-in','like','comment') and 
event_date>='06/01/2022' and event_date<='06/30/2022')
and event_date>='07/01/2022' and event_date<='07/31/2022'
group by extract(month from event_date)
Bai6
SELECT LEFT(trans_date, 7) AS month, 
country,
COUNT(*) AS trans_count,
SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count, 
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved'THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country
Bai7
SELECT P.product_id, MIN(S.year) AS first_year , S.quantity, S.price
FROM Product AS P
LEFT JOIN Sales AS S
ON P.product_id = S.product_id

GROUP BY S.product_id
HAVING S.quantity IS NOT NULL
Bai8

Bai9

Bai10

Bai11
select results from 
(select t.name as results,
count(m.rating) as h
from Users as t join MovieRating as m on t.user_id=m.user_id
group by t.name
order by h desc, t.name
limit 1) as k
union
select results from
(select e.title as results,
avg(rating) as h
from Movies as e join MovieRating as m on e.movie_id=m.movie_id
where left(created_at,7)='2020-02'
group by e.title
order by h desc, e.title
limit 1) as i
Bai12
select id, max(num) as num
from
(select requester_id as id,
count(accepter_id) as num
from RequestAccepted
group by requester_id) as a
