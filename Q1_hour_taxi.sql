
select cast(strftime('%H', pickup_datetime) as int) as hour, count(*) as trip_count
from taxi_trips
where strftime('%Y-%m',pickup_datetime) between "2009-01" and "2015-06"
group by strftime('%H', pickup_datetime)
order by trip_count desc
