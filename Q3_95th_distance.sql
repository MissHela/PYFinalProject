
select trip_distance
from
(
    select 
        trip_distance,
        PERCENT_RANK() over (order by trip_distance asc) percentile
    from
    (
        select trip_distance
        from uber_trips
        where strftime('%Y-%m',pickup_datetime)= "2013-07" 
        union all
        select trip_distance
        from taxi_trips
        where strftime('%Y-%m',pickup_datetime)= "2013-07"
    )
)
order by abs(percentile-0.95) asc
limit 1
