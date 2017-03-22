UPDATE account a SET a.last_activity_date = 
(SELECT MAX(t.txn_date) 
FROM transaction t WHERE t.account_id = a.account_id) 
WHERE EXISTS (SELECT 1 FROM transaction t WHERE t.account_id = a.account_id);