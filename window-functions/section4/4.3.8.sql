with boundary as (select to_char(wdate, 'YYYY-MM') as wmonth,
                         percentile_cont(0.90) within group (order by pressure)
                                                   as p90
                  from weather
                  group by to_char(wdate, 'YYYY-MM'))
select to_char(wdate, 'YYYY-MM')                       as wmonth,
       count(*) filter (where pressure > boundary.p90) as over_count
from weather
         join boundary on to_char(wdate, 'YYYY-MM') = boundary.wmonth
group by
    to_char(wdate, 'YYYY-MM')
order by
    wmonth;