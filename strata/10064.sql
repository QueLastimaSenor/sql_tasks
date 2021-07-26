with total_energy as (
    select * from fb_eu_energy
    union all
    select * from fb_asia_energy
    union all
    select * from fb_na_energy
    ),

total_consumption as (
    select date, sum(consumption) from total_energy
    group by date
    order by sum desc
    ),

max_energy as (
    select max(sum)
    from total_consumption
    )
    
select a.* from total_consumption a
right join max_energy b
on b.max = a.sum
