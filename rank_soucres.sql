-- rank water source
SELECT type_of_water_source,
	SUM(number_of_people_served) AS population_served,
    RANK() OVER (ORDER BY SUM(number_of_people_served)ASC) AS rank_by_population
FROM water_source
WHERE type_of_water_source IN ('tap_in_home_broken','well','shared_tap','river')
GROUP BY type_of_water_source
ORDER BY population_served;

-- most used water_source should be fixed first
SELECT 
	DENSE_RANK () OVER(ORDER BY number_of_people_served ASC) AS priority_rank
FROM
	water_source;






