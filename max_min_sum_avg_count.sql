SELECT max(avail_balance) max_balance, min(avail_balance) min_balance, avg(avail_balance) avg_balance, sum(avail_balance) sum_balance,
count(*) num_accounts FROM account WHERE product_cd='CHK';