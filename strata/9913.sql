select a.first_name, b.order_date, b.order_details, b.order_cost
from customers a
join orders b
on a.id = b.cust_id
where a.first_name in ('Jill', 'Eva')
order by a.id asc
