SELECT groups.name, COUNT(*) num_customers 
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
 GROUP BY groups.name;

/* 

SELECT 'Small Fry' name, 0 low_limit, 4999.99 high_limit 
UNION ALL 
SELECT 'Average Joes' name, 5000 low_limit, 9999.99 high_limit 
UNION ALL 
SELECT 'Heavy Hitters' name, 10000 low_limit, 9999999.99 high_limit;
Здесь с помощью оператора для работы с наборами union all (объединить все) результаты трех отдельных запросов сводятся в один результирующий набор. 
Каждый запрос получает три литерала. Результаты этих трех запросов объединяются для формирования таблицы, состоящей из трех строк и трех столбцов.
++++
| name          | low_limit | high_limit |
++++
| Small Fry     | 0         | 4999.99    |
| Average Joes  | 5000      | 9999.99    |
| Heavy Hitters | 10000     | 9999999.99 |
++++
3 rows in set (0.00 sec)

**********************


В блоке from имеется два подзапроса: 
первый подзапрос, cust_rollup,возвращает общий остаток по депозитным счетам для каждого клиента,
а второй подзапрос, groups, формирует таблицу, содержащую три группы клиентов. 



SELECT SUM(a.avail_balance) cust_balance, a.cust_id cust_id 
FROM account a INNER JOIN product p 
ON a.product_cd = p.product_cd 
WHERE p.product_type_cd = 'ACCOUNT' GROUP BY a.cust_id;
возвращает общий остаток по депозитным счетам для каждого клиента

Вот таблица, сгенерированная подзапросом cust_rollup:
SELECT SUM(a.avail_balance) cust_balance FROM account a INNER JOIN product p ON a.product_cd = p.product_cd
WHERE p.product_type_cd = 'ACCOUNT'
GROUP BY a.cust_id;

++

| cust_balance |
++
| 4557.75 |
| 2458.02 |
| 3270.25 |
| 6788.98 |
| 2237.97 |
| 10122.37 |
| 5000.00 |
| 3875.18 |
| 10971.22 |
| 23575.12 |
| 38552.05 |
++
11 rows in set (0.05 sec)
***********************

Затем таблица, сгенерированная подзапросом cust_rollup, соединяется с таблицей groups посредством условия вхождения в диапазон 
(cust_rollup.cust_balance BETWEEN groups.low_limit AND groups.high_limit). Наконец, соединенные данные группируются и подсчитывается 
число клиентов в каждой группе для формирования окончательного результирующего набора.




*/