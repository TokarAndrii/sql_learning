SELECT groups.name, groups.low_limit,groups.high_limit, COUNT(*) num_customers,sum(cust_rollup.cust_balance) sum_by_group
FROM (
SELECT SUM(a.avail_balance) cust_balance
 FROM account a INNER JOIN product p ON a.product_cd = p.product_cd 
 WHERE p.product_type_cd = 'ACCOUNT' 
 GROUP BY a.cust_id) cust_rollup INNER JOIN 
 
 (SELECT 'Small Fry' name, 0 low_limit, 4999.99 high_limit
 UNION ALL
 SELECT 'Average Joes' name, 5000 low_limit,
 9999.99 high_limit
 UNION ALL
 SELECT 'Heavy Hitters' name, 10000 low_limit,
 9999999.99 high_limit) groups
 
 ON cust_rollup.cust_balance
 BETWEEN groups.low_limit AND groups.high_limit
 GROUP BY groups.low_limit;