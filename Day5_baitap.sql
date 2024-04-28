Bai1
select distinct city
from station
where ID%2=0
Bai2
SELECT COUNT (CITY) - COUNT (DISTINCT CITY) FROM STATION
BAI3
BAI4
SELECT
ROUND(CAST(SUM(ITEM_COUNT*ORDER_OCCURRENCES)/SUM(ORDER_OCCURRENCES) AS DECIMAL),1) AS mean
FROM ITEMS_PER_ORDER;
BAI5
SELECT candidate_id FROM candidates
WHERE SKILL IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(SKILL) = 3
ORDER BY candidate_idd
BAI6
SELECT USER_ID,
DATE(MAX(post_date)) - DATE(MIN(post_date)) as DAYs_BETWEEN
FROM posts
WHERE post_date>= '2021-01-01' AND post_date < '2022-01-01'
GROUP BY USER_ID
Having count (post_id)>=2
BAI7
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name
order by difference DEsc
bai8

