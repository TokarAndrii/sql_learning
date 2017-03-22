SELECT c.cust_id, c.cust_type_cd, c.city 
FROM customer c WHERE 
(SELECT SUM(a.avail_balance) 
FROM account a WHERE a.cust_id = c.cust_id) 
BETWEEN 5000 AND 10000;