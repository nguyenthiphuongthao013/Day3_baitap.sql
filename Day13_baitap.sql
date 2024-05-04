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

Bai6

Bai7

Bai8

Bai9

Bai10

Bai11

Bai12
