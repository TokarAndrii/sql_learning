SELECT emp_id, fname, lname, title 
FROM employee 
WHERE emp_id IN (SELECT superior_emp_id FROM employee);
/*Следующий запрос использует оператор in и подзапрос в правой части условия фильтрации для того, что бы выявить руководящий состав банка */