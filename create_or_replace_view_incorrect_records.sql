-- investigation: find corrupt employees. 
CREATE OR REPLACE VIEW Incorrect_records_VIEW AS (
    SELECT
        auditor_report.location_id,
        visits.record_id,
        employee.employee_name,
        auditor_report.true_water_source_score AS auditor_score,
        wq.subjective_quality_score AS surveyor_score,
        auditor_report.statements 
    FROM
        auditor_report
    JOIN
        visits ON auditor_report.location_id = visits.location_id
    JOIN
        water_quality AS wq ON visits.record_id = wq.record_id
    JOIN
        employee ON employee.assigned_employee_id = visits.assigned_employee_id
    WHERE
        visits.visit_count = 1
        AND auditor_report.true_water_source_score != wq.subjective_quality_score
);

WITH error_count AS ( -- This CTE calculates the number of mistakes each employee made
    SELECT
        employee_name,
        COUNT(*) AS number_of_mistakes
    FROM
        Incorrect_records
    GROUP BY
        employee_name
),

 suspect_list AS (SELECT -- this CTE links the  location_id and statements 
    ec.employee_name AS suspect_list,
    ec.number_of_mistakes AS number_of_mistakes
FROM 
    error_count ec
WHERE
    ec.number_of_mistakes > (SELECT AVG(number_of_mistakes) FROM error_count) 
    )
SELECT 
	irv.location_id,
	irv.employee_name,
	irv.statements
FROM 
	 Incorrect_records_VIEW irv
WHERE
    irv.employee_name IN (SELECT employee_name FROM suspect_list) 
AND
	statements LIKE '%Suspicion%';
    