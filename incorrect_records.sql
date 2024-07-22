-- check the incorrect data, remaining 6%=102 rows and anyother errors left.
 SELECT
	auditor_report.location_id,
	auditor_report.true_water_source_score AS auditor_score,
    water_quality.subjective_quality_score AS surveyor_score,
    water_quality.record_id,
	employee.employee_name
FROM
	auditor_report
JOIN
	visits
ON 
	auditor_report.location_id = visits.location_id
JOIN
	employee
ON
	employee.assigned_employee_id =  visits.assigned_employee_id
JOIN
	water_quality
ON 
	water_quality.record_id = visits.record_id
JOIN
	water_source
WHERE true_water_source_score != subjective_quality_score AND
 visits.visit_count = 1
LIMIT 10000;
