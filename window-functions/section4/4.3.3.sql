with temp as (select wdate,
                     wtemp,
                     precip,
                     dense_rank() over w as myrank
              from weather
              where wdate between '2020-04-01' and '2020-04-31'
              window w as (partition by precip order by wdate desc))

select wdate, wtemp, precip
from temp
where myrank = 1
order by
    wdate asc;