with cte as(
    select *, 
    coalesce(
        created_at - 
        (lag(created_at) 
        over(partition by user_id order by created_at))
    ,0) diff_dates, 
    count(*) over(partition by user_id) days,
    count(*) over(partition by created_at, user_id) times
    from amazon_transactions
)

select a.user_id
from amazon_transactions a
join cte b
on a.id = b.id
where b.days > 1
and b.diff_dates < 8
and (b.diff_dates > 0 or b.times > 1) 
group by a.user_id 
order by a.user_id
