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
