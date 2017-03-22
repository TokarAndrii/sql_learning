SELECT account_id, product_cd, open_branch_id, open_emp_id, cust_id FROM account 
WHERE (open_branch_id, open_emp_id) 
IN (SELECT b.branch_id, e.emp_id 
FROM branch b INNER JOIN employee e ON b.branch_id = e.assigned_branch_id
WHERE b.name = 'Woburn Branch' AND (e.title = 'Teller' OR e.title = 'Head Teller'));
/* для выбора всех текущих счетов, от крытых старшим операционистом в отделении Woburn */