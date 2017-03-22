SELECT product_cd, SUM(avail_balance) prod_balance FROM account WHERE status = 'ACTIVE' GROUP BY product_cd HAVING SUM(avail_balance) >= 10000;
/*Если по ошибке оба фильтра помещены в блок where, возникает следующая ошибка:

mysql> SELECT product_cd, SUM(avail_balance) prod_balance

> FROM account

> WHERE status = 'ACTIVE'

> AND SUM(avail_balance) > 10000

> GROUP BY product_cd;

ERROR 1111 (HY000): Invalid use of group function*/