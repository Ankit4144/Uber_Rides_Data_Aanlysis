select * from uber_csv;

UPDATE uber_csv
SET Request_Date = STR_TO_DATE(NULLIF(Request_Date, ''), '%m/%d/%Y');

UPDATE uber_csv
SET Drop_Date = STR_TO_DATE(NULLIF(Drop_Date, ''), '%m/%d/%Y');

ALTER TABLE uber_csv
MODIFY COLUMN Request_Date DATE;

ALTER TABLE uber_csv
MODIFY COLUMN Drop_Date DATE;

UPDATE uber_csv
SET Drop_time = STR_TO_DATE(NULLIF(Drop_time, ''), '%h:%i:%s %p');
UPDATE uber_csv
SET Request_Time = STR_TO_DATE(NULLIF(Request_time, ''), '%h:%i:%s %p');


ALTER TABLE uber_csv
MODIFY COLUMN Drop_time TIME;
ALTER TABLE uber_csv
MODIFY COLUMN Request_Time TIME;

UPDATE uber_csv
SET Driver_id = NULL
WHERE Driver_id = 0;

## Completion rate

select round(sum(Status= 'Trip Completed')/count(*)*100,2) as Ride_Completion_Percent
from uber_csv;

## Driver Performance Analysis

select Driver_id, count(Status) as Status
from uber_csv
where Status = 'Trip Completed'
group by Driver_id
order by count(Status) desc limit 5;

## Peak Request Hours

select hour(Request_Time) as Req_hour, count(*) as Total_Req, Time_Slot
from uber_csv
group by Time_Slot, Req_hour
order by count(*) desc limit 10;

## Overview
select
  count(*) AS total_requests,
  sum(Status = 'Trip Completed') as completed_trips,
  sum(Status = 'Cancelled') as cancelled_trips,
  round(sum(Status = 'Trip Completed') / count(*) * 100, 2) as completion_rate,
  round(sum(`Trip_Duration(mins)`) / sum(Status = 'Trip Completed'), 2) as avg_trip_duration
from uber_csv;