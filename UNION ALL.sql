SELECT cust_id, lname name from individual UNION ALL SELECT cust_id, name FROM business;
/* union all в конечной таблице всегда будет столько строк, сколько во всех исходных таблицах в сумме.*/