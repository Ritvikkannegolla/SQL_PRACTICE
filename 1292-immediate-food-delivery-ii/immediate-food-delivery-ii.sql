-- Write your PostgreSQL query statement below
select
round(
    avg(case when order_date = customer_pref_delivery_date then 1 else 0 end)*100,
    2)
as immediate_percentage
from delivery
WHERE (customer_id, order_date) IN 
(
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);