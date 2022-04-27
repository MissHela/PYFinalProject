
select 
    a.hour,
    a.trip_count,
    b.average_precipitation,
    b.average_wind_speed
from
(
    select 
        strftime('%H',pickup_datetime) as hour,
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
    group by strftime('%H',pickup_datetime)
) a
left join
(
    select 
        strftime('%H',DATE) as hour,
        avg(HourlyPrecipitation) as average_precipitation,
        avg(HourlyWindSpeed) as average_wind_speed
    from hourly_weather
    where strftime('%Y-%m-%d',DATE) between '2012-10-23' and '2012-10-30' 
    group by strftime('%H',DATE)
) b
on a.hour = b.hour
    
