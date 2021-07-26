with total_orders as(
    select a.id, count(b.order_date)
    from customers a
    join orders b
    on a.id = b.cust_id
    group by a.id
)

select id, count 
from total_orders
where count = (
    select max(count) from total_orders
)

