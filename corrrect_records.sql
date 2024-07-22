SELECT * FROM md_water_services.auditor_report;

SELECT
	location_id, true_water_source_score
FROM 
	auditor_report;

-- join the visits table to the auditor_report table. Grab record_id and location_id.
SELECT
	auditor_report.location_id AS audit_location,
	auditor_report.true_water_source_score,
	visits.location_id AS visit_location,
	visits.record_id
FROM
	auditor_report
JOIN
	visits
ON auditor_report.location_id = visits.location_id;


-- join the water_source table to the auditor_report table. Grab subjective_quality_score and record_ID.
 SELECT 
	visits.record_id,
	visits.location_id,
	water_quality.subjective_quality_score,
    water_quality.record_ID
FROM
	water_quality
 JOIN
	visits
ON
	water_quality.record_id = visits.record_id;

-- join the above tables
SELECT
	auditor_report.location_id ,
	auditor_report.true_water_source_score AS auditor_score,
    water_quality.subjective_quality_score AS surveyor_score,
    water_quality.record_id,
    visits.visit_count
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id
JOIN
	water_quality
ON 
	water_quality.record_id = visits.record_id
WHERE 
	true_water_source_score = subjective_quality_score AND  -- check if the auditor's and exployees' scores agree. 1518/1620 = 94% of the records the auditor checked were correct.
    visits.visit_count = 1
LIMIT 10000;
	
