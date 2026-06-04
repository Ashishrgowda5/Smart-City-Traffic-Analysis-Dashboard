CREATE DATABASE traffic_analysis;
USE traffic_analysis;
CREATE TABLE traffic_data (
    Time TIME,
    Date INT,
    Day_of_Week VARCHAR(20),
    CarCount INT,
    BikeCount INT,
    BusCount INT,
    TruckCount INT,
    Total INT,
    Traffic_Situation VARCHAR(20),
    Peak_Hour VARCHAR(20),
    Traffic_Level VARCHAR(20),
    Day_Type VARCHAR(20),
    Dominant_Vehicle VARCHAR(20)
);
SELECT * FROM `traffic month1-cleaned`
LIMIT 10;

-- Average traffic volume
SELECT AVG(Total) AS Average_Traffic
FROM `traffic month1-cleaned`;

-- which day has a highest traffice 
select `Day of the week`, avg(total) as avg_traffic
from `traffic month1-cleaned`
group by `Day of the week`
order by avg_traffic desc;

-- Which traffic situation occurs most?
select `Traffic Situation`, count(*) as total_count
from `traffic month1-cleaned`
group by `Traffic Situation`
order by total_count desc;

-- Which vehicle contributes most to traffic?
select 
avg(CarCount) as cars,
avg(BikeCount) as bikes,
avg(BusCount) as buses,
avg(TruckCount) as trucks
from `traffic month1-cleaned`;

-- Find busiest time period


select 
case
	when hour(Time) < 12 then 'Morning'
	when hour(Time) < 17 then 'Afternoon'
	else 'Evening'
end as Peak_Hour,
avg(total) as avg_traffic
from `traffic month1-cleaned`
group by Peak_Hour
order by avg_traffic desc;
describe `traffic month1-cleaned`;

select
case
	when hour(`ï»¿Time`) < 12 then 'Morning'
	when hour(`ï»¿Time`) < 17 then 'Afternoon'
	else 'Evening'
end as Peak_Hour,
avg(total) as avg_traffic
from `traffic month1-cleaned`
group by Peak_Hour
order by avg_traffic desc;

-- which traffice level occurs most
select `Traffice level`, count(*) as total_count
from `traffice month1-cleaned`
group by `Traffice level`
order by total_count desc;

-- Find total number of records
select count(*) as total_records
from `traffic month1-cleaned`;


-- INSIGHTS YOU FOUND

-- Average traffic = 114.21
-- Wednesday has highest traffic
-- Normal traffic occurs most
-- Cars dominate traffic volume
-- Morning has highest congestion
-- Dataset contains 2976 records