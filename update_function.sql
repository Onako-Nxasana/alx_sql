-- The command below is used to disable the safe update mode temporarly 
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM well_pollution;
UPDATE well_pollution
SET description = 'Bacteria: E. coli'
WHERE description = 'Clean Bacteria: E. coli';
UPDATE well_pollution
SET description = 'Bacteria: Giardia Lamblia'
WHERE description = 'Clean Bacteria: Giardia Lamblia';
UPDATE well_pollution
SET results = 'Contaminated: Biological'
WHERE biological > 0.01 AND results = 'Clean';
    
SELECT
*
FROM
	well_pollution_copy
WHERE
	description LIKE "Clean_%"
	OR (results = "Clean" AND biological > 0.01);
    DROP Table well_pollution_copy; 