-- how long the survey took
SELECT
	MIN(time_of_record) AS first_day,
    MAX(time_of_record) AS day_day,
	DATEDIFF(MAX(time_of_record),MIN(time_of_record)) 
FROM visits;

-- average que time
SELECT
    AVG(time_in_queue) AS average_time
FROM visits
	WHERE time_in_queue != '0';

--  queue times aggregated across the different days of the week.
SELECT
   DAYNAME(time_of_record) AS day_of_week,
   AVG(time_in_queue) AS average_queue_time
FROM 
	visits
WHERE 
	time_in_queue != '0'
GROUP BY 
	DAYNAME(time_of_record)
ORDER BY 
	WEEKDAY(day_of_week);

--  time during the day people collect water

SELECT 
	TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
	AVG(time_in_queue) AS average_queue_time
FROM visits
GROUP BY
	TIME_FORMAT(TIME(time_of_record), '%H:00')
ORDER BY
		hour_of_day;























