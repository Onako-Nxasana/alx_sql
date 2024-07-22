SELECT
    auditorRep.location_id,
    visitsTbl.record_id,
    Empl_Table.employee_name,
    auditorRep.true_water_source_score AS auditor_score,
    wq.subjective_quality_score AS employee_score
FROM 
	auditor_report AS auditorRep
JOIN 
    visits AS visitsTbl
ON 
	auditorRep.location_id = visitsTbl.location_id
JOIN 
	water_quality AS wq
ON visitsTbl.record_id = wq.record_id
	JOIN employee as Empl_Table
ON Empl_Table.assigned_employee_id = visitsTbl.assigned_employee_id
LIMIT 10000;

