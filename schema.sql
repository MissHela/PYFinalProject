CREATE TABLE
IF NOT EXISTS uber_trips
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fare_amount	FLOAT,
    pickup_datetime	DATETIME,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    trip_distance FLOAT
);

CREATE TABLE
IF NOT EXISTS taxi_trips
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_datetime	DATETIME,
    dropoff_datetime DATETIME,
    pickup_longitude FLOAT,
    pickup_latitude FLOAT,
    dropoff_longitude FLOAT,
    dropoff_latitude FLOAT,
    tip_amount FLOAT,
    total_amount FLOAT,
    trip_distance FLOAT
);

CREATE TABLE
IF NOT EXISTS hourly_weather
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    DATE DATETIME,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);

CREATE TABLE
IF NOT EXISTS daily_weather
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    DATE DATE,
    HourlyPrecipitation FLOAT,
    HourlyWindSpeed FLOAT
);