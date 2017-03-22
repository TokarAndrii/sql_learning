SELECT account_id,avail_balance, product_cd, b.name branch_name, e.fname employee_fname,e.lname employee_fname,  cust_id
FROM account a 
INNER JOIN employee e on open_emp_id=e.emp_id
INNER JOIN branch b on open_branch_id=b.branch_id
WHERE (open_branch_id, open_emp_id) 
IN (SELECT b.branch_id, e.emp_id 
FROM branch b INNER JOIN employee e ON b.branch_id = e.assigned_branch_id
WHERE b.name = 'Woburn Branch' AND (e.title = 'Teller' OR e.title = 'Head Teller'))
GROUP BY account_id,cust_id;