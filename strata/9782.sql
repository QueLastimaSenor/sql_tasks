select cust_id,
sum(order_cost * order_quantity) as revenue
from orders
where to_char(order_date, 'YYYY-MM') = '2019-03'
group by cust_id
order by revenue desc
