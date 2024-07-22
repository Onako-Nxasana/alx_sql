SELECT * FROM
   employee;

UPDATE employee
SET Email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')), '@endogowater.gov')

