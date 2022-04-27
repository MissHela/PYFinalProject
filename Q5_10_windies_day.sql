
select
    a.date,
    HourlyWindSpeed,
    trip_count
from
(
    select date, HourlyWindSpeed
    from daily_weather
    where strftime('%Y',date) = '2014'
    order by HourlyWindSpeed desc
    limit 10
) a
left join
(
    select 
        strftime('%Y-%m-%d',pickup_datetime) as date,
        count(*) as trip_count
    from
    (
        select pickup_datetime
        from uber_trips
        where strftime('%Y',pickup_datetime) = '2014'
        union all
        select pickup_datetime
        from taxi_trips
        where strftime('%Y',pickup_datetime) = '2014'
    )
    group by strftime('%Y-%m-%d',pickup_datetime)
) b
on a.date=b.date
