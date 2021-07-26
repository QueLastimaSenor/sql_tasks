with cte as(
    select a.first_name, b.order_date,sum(b.order_cost * b.order_quantity)
    from customers a
    join orders b
    on a.id = b.cust_id
    where b.order_date between '2019-02-01'::date and '2019-05-01'::date
    group by a.first_name, b.order_date
)

select * 
from cte
where sum = (
    select max(sum) from cte
)

