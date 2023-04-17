with distance as (select user_id,
                         adate,
                         points,
                         points - lag(points, 1) over w as `lag`
                  from activity
                  window w as (partition by user_id order by adate)),

     agroups as (select user_id,
                        adate,
                        points,
                        `lag`,
                        sum(case when `lag` < 0 then 1 else 0 end) over w as group_id
                 from distance
                 window w as (partition by user_id order by adate))

select user_id,
       min(adate)     as day_start,
       max(adate)     as day_end,
       count(user_id) as day_count,
       sum(points)    as p_total
from agroups
group by
    user_id,
    group_id
having day_count > 1
order by
    user_id asc,
    day_start asc;