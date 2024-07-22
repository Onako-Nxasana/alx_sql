-- how many of our employees live in each town

SELECT town_name, 
	COUNT(town_name) AS employees_in_town 
FROM employee
GROUP BY town_name;
