SELECT account_id, product_cd, cust_id, avail_balance 
FROM account 
WHERE open_emp_id <> (SELECT e.emp_id FROM employee e 
INNER JOIN branch b ON e.assigned_branch_id = b.branch_id 
WHERE e.title = 'Head Teller' AND b.city = 'Woburn');
/*Такой тип подзапроса называется скалярным подзапросом (scalar subquery), и его можно 
помещать в любую часть условия, использующего обычные операторы(=, <>, <, >, <=, >=). Pапрос возвращает данные по всем счетам, которые были открыты 
операционистом отделения Woburn, который не является старшим */