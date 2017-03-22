SELECT c.cust_id, c.cust_type_cd, c.city FROM customer c WHERE 2 = (SELECT COUNT(*) FROM account a WHERE a.cust_id = c.cust_id);
/* Связанный подзапрос (correlated subquery), напротив, зависит от содержащего выражения, из которого он ссылается на один или более столбцов. */