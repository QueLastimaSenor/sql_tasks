with sum_over_months as(
    select to_char(created_at, 'YYYY-MM') as year_month,
    sum(value)
    from sf_transactions
    group by year_month
    order by year_month
)

select year_month,
round((sum - lag(sum) over(order by year_month))/lag(sum) over(order by year_month)*100.0, 2)
from sum_over_months
