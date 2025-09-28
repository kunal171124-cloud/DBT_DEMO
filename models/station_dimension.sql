with bike as (

select

START_STATION_ID AS    start_id,
START_STATION_NAME   AS  start_name,
START_LATITUDE AS    start_lat,
START_LONGITUDE AS  start_station_lag

 
from
{{ source('demo', 'BIKE') }}
where RIDE_ID != 'ride_id'

limit 10
)

select * from bike
