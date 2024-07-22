-- total number of people surved 
 SELECT COUNT(number_of_people_served) AS total_people_surveyed
FROM water_source;

-- How may wells, rivers and taps are there? 
SELECT type_of_water_source,
	COUNT(type_of_water_source) AS number_of_water_source
FROM water_source
GROUP BY type_of_water_source
ORDER BY number_of_water_source DESC;

SELECT type_of_water_source,
	AVG(number_of_people_served) AS avg_people_per_water_source
FROM water_source
GROUP BY type_of_water_source
ORDER BY avg_people_per_water_source DESC;
-- 1 tap_in_home actually represents 644 ÷ 6 = ± 100 taps

-- number of people per water source
SELECT type_of_water_source,
	SUM(number_of_people_served) AS population_served
FROM water_source
GROUP BY type_of_water_source;