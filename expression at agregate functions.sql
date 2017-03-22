SELECT MAX(pending_balance-avail_balance) max_uncleared FROM account;
/*В качестве аргументов агрегатных функций вы можете использовать не только столбцы, но и созданные вами выражения */