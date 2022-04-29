
with recursive consecutive_hour as(
    select '2012-10-23 00:00:00' date_hour
    union all 
    -- recursion with stop condition
    select datetime(date_hour, '+1 hour') 
    from consecutive_hour 
    where datetime(date_hour, '+1 hour') < '2012-10-31 00:00:00'
),
weather as (
    select 
        strftime('%Y-%m-%d %H:00:00', date) as date_hour,
        HourlyPrecipitation,
        HourlyWindSpeed
    from hourly_weather
    where strftime('%Y-%m-%d',DATE) between '2012-10-23' and '2012-10-30' 
),
trip_count as (
    select 
        strftime('%Y-%m-%d %H:00:00',pickup_datetime) as date_hour,
        count(*) as trip_count
    from
    (
        select pickup_datetime
        from uber_trips
        where strftime('%Y-%m-%d',pickup_datetime) between '2012-10-23' and '2012-10-30' 
        union all
        select pickup_datetime
        from taxi_trips
        where strftime('%Y-%m-%d',pickup_datetime) between '2012-10-23' and '2012-10-30' 
    )
    group by strftime('%Y-%m-%d %H:00:00',pickup_datetime)
)
select 
    consecutive_hour.date_hour, 
    COALESCE(trip_count.trip_count, 0) as trip_count,
    COALESCE(weather.HourlyPrecipitation, 0) as HourlyPrecipitation,
    COALESCE(weather.HourlyWindSpeed, 0) as HourlyWindSpeed
from consecutive_hour
left join trip_count
on consecutive_hour.date_hour = trip_count.date_hour
left join weather
on consecutive_hour.date_hour = weather.date_hour
