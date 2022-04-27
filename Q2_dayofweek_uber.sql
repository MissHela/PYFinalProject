
select cast(strftime('%w', pickup_datetime) as int) as day_of_week, count(*) as trip_count
from uber_trips
where strftime('%Y-%m',pickup_datetime) between "2009-01" and "2015-06"
group by strftime('%w', pickup_datetime)
