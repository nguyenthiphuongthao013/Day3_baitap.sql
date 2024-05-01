Bai1
select distinct a.continent,
floor(Avg(b.population))
from country as a
inner join city as b
on a.code=b.countrycode
group by a.continent
Bai2
SELECT 
CAST(COUNT(T.email_id) as decimal)/COUNT(DISTINCT E.email_id)
FROM emails as E
LEFT JOIN texts as T
on E.email_id=T.email_id
and T.signup_action = 'confirmed'
Bai3
SELECT AG.age_bucket, 
ROUND(100*SUM(CASE WHEN AC.activity_type LIKE '%send%' THEN AC.time_spent ELSE 0 END)/SUM(AC.time_spent),2) AS send_perc, 
ROUND(100*SUM(CASE WHEN AC.activity_type LIKE '%open%' THEN AC.time_spent ELSE 0 END)/SUM(AC.time_spent),2) AS open_perc
FROM activities AS AC
INNER JOIN age_breakdown AS AG
ON AC.user_id = AG.user_id
WHERE activity_type !='chat'
GROUP BY 1;
Bai4
SELECT C.customer_id AS Supercloud_customers,
COUNT (DISTINCT P.product_category) AS result
FROM customer_contracts as C
LEFT JOIN products as P
on C.product_id=P.product_id
AND product_category  IN ('Analytics', 'Containers', 'Compute')
GROUP BY C.customer_id
HAVING COUNT (DISTINCT P.product_category) = 3
Bai5
SELECT EM.employee_id, EM.name,
count(RE.reports_to) as reports_count, 
ROUND(AVG(EM.age)) AS average_age
FROM Employees as EM
LEFT JOIN Employees as RE
on EM.employee_id = RE.reports_to
Bai6
select
P.product_name,
sum(O.unit) as unit
from
products as P
left join orders as O
on P.product_id = O.product_id
where O.order_date between '2020-02-01' AND '2020-02-29'
group by P.product_name, P.product_id
Having sum(O.unit)>= 100
Bai7
SELECT
P.page_id
FROM
pages as P
LEFT JOIN
page_likes as L
ON P.page_id=L.page_id
WHERE L.user_id is NULL
ORDER BY page_id
