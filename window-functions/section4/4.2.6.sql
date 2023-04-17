with agroups as (select user_id,
                        adate,
                        unixepoch(adate) / 86400 -
                        row_number() over w as group_id
                 from activity
                 window w as (partition by user_id order by adate))

select user_id,
       min(adate)      as day_start,
       max(adate)      as day_end,
       count(group_id) as day_count
from agroups
group by
    user_id,
    group_id
order by
    user_id asc,
    day_start asc;