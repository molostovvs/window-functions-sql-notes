select wdate,
       precip,
       ifnull(precip, round(avg(precip) over w, 1)) as fixed
from weather
where wdate between '2020-03-06' and '2020-03-11'
   or wdate between '2020-06-01' and '2020-06-06'
window w as ( partition by strftime('%m', wdate)
        rows between 1 preceding and 1 following )
order by
    wdate;
