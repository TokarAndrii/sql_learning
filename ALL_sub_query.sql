SELECT emp_id, fname, lname, title 
FROM employee
WHERE emp_id <> ALL (SELECT DISTINCT superior_emp_id 
FROM employee WHERE superior_emp_id IS NOT NULL);
/* запрос находит всех сотрудников,ID которых не равен ни одному из ID руководителей: */