Bai1
SELECT
EXTRACT(YEAR FROM transaction_date) as year,
product_id,
spend AS curr_year_spend,
LAG(spend)OVER(PARTITION BY product_id ORDER BY transaction_date) AS prev_year_spend, 
ROUND((spend-(LAG(spend)OVER(PARTITION BY product_id ORDER BY transaction_date)))/(LAG(spend)OVER(PARTITION BY product_id ORDER BY transaction_date))*100,2) as yoy_rate
FROM user_transactions
ORDER BY product_id
Bai2
SELECT  
DISTINCT card_name,
FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) as issued_amount
FROM monthly_cards_issued
ORDER BY issued_amount DESC
Bai 3
SELECT user_id, 	spend, transaction_date FROM
(
SELECT user_id, 	spend, transaction_date,
RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ) AS M 
FROM transactions) AS s 
WHERE M = 3
Bai 4
WITH CTE AS (
SELECT product_id, user_id, spend,transaction_date,
max(transaction_date) OVER(PARTITION BY user_id)
FROM user_transactions)
SELECT transaction_date, user_id, COUNT(product_id) AS purchase_count
FROM CTE
WHERE transaction_date=max
GROUP BY transaction_date, user_id
Bai5
SELECT
user_id, tweet_date, ROUND(AVG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg
FROM tweets
Bai6
WITH ctE AS (
SELECT transaction_id, merchant_id, credit_card_id,amount, transaction_timestamp, 
LEAD (transaction_timestamp) OVER(PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) as TT2,
(LEAD (transaction_timestamp) OVER(PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp)-transaction_timestamp) AS TIME
FROM transactions)
select count(*) as payment_count
from cte
where tIME <= '00:10:00'
BAI7
with cte as (
SELECT category, product, 	
SUM(spend) as total_spend, 
RANK() OVER(PARTITION BY category ORDER BY SUM(spend) DESC) AS RANK 
FROM product_spend
WHERE transaction_date BETWEEN '01/01/2022' AND '12/31/2022'
GROUP BY category, product)
SELECT 
category,
product,
total_spend
FROM CTE
WHERE RANK = 1 OR RANK = 2
Bai8
SELECT artist_name, artist_rank
FROM
 (
SELECT
A.artist_name,
DENSE_RANK()OVER(ORDER BY COUNT(S.song_id) DESC) AS artist_rank
FROM artists as A  
JOIN songs as S
ON A.artist_id=S.artist_id
JOIN global_song_rank as G 
ON S.song_id=G.song_id
WHERE RANK <10
GROUP BY A.artist_name) AS WW
LIMIT 7
