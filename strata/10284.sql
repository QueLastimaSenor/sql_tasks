with inv_table as (
    select user2 as user1, user1 as user2
    from facebook_friends
),

comb_table as (
    select * from facebook_friends
    union 
    select * from inv_table
),

total as (
    select user1, count(*) friends
    from comb_table
    group by user1
)

select user1, (friends::float /
count(*) over()
) * 100.0 percentage
from  total
