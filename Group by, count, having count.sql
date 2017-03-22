SELECT open_emp_id from account GROUP BY open_emp_id;
SELECT open_emp_id, count(*) How_Many from account GROUP BY open_emp_id;
SELECT open_emp_id, COUNT(*) how_many FROM account GROUP BY open_emp_id HAVING COUNT(*) > 4;