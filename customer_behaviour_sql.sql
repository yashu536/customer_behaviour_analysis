use customer_data
select * from customerdata limit 10
select gender,SUM(purchase_amount) as revenue
from customerdata
group by gender
select customer_id,purchase_amount
from customerdata
where discount_applied='yes' and purchase_amount>=(select AVG(purchase_amount)from customerdata)
with item_count as(
select category,
item_purchased,
COUNT(customer_id)as total_orders,
ROW_NUMBER() Over (partition by category order by count(customer_id)DESC) as item_rank
from customerdata
group by  category,item_purchased
)
select item_rank,category,item_purchased,total_orders
from item_counts
where item_rank<=3;
select item_purchased, ROUND(AVG(review_rating::numeric),2) as "Average Product Rating"
from customerdata
group by item_purchased
order by avg(review_rating) desc
limit 5;
SELECT
    item_purchased,
    ROUND(AVG(review_rating), 2) AS "Average Product Rating"
FROM customerdata
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;
select * from customerdata limit 10
WITH item_count AS (
    SELECT
        category,
        item_purchased,
        COUNT(customer_id) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY COUNT(customer_id) DESC
        ) AS item_rank
    FROM customerdata
    GROUP BY category, item_purchased
)
SELECT
    item_rank,
    category,
    item_purchased,
    total_orders
FROM item_count
WHERE item_rank <= 3
ORDER BY category, item_rank;
select * from customerdata

