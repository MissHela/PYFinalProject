
select date, ride_count, avg_distance
from
(
    select 
        strftime('%Y-%m-%d',pickup_datetime) as date,
        count(trip_distance) as ride_count,
        avg(trip_distance) as avg_distance
    from
    (
        select pickup_datetime, trip_distance
        from uber_trips
        where strftime('%Y',pickup_datetime) = '2009'
        union all
        select pickup_datetime, trip_distance
        from taxi_trips
        where strftime('%Y',pickup_datetime) = '2009'
    )
    group by strftime('%Y-%m-%d',pickup_datetime) 
)
order by ride_count desc, avg_distance desc
limit 10
