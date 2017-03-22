SELECT account_id, cust_id, product_cd, avail_balance 
FROM account WHERE avail_balance > ANY (SELECT a.avail_balance 
FROM account a 
INNER JOIN individual i ON a.cust_id = i.cust_id 
WHERE i.fname = 'Frank' AND i.lname = 'Tucker');
/* найти все счета, доступный остаток которых больше, чем на любом из счетов Фрэнка Такера */