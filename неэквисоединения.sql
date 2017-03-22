SELECT e.emp_id, e.fname, e.lname, e.start_date FROM employee e INNER JOIN product p ON e.start_date>=p.date_offered;
/*неэквисоединениями (nonequijoins) найти всех сотрудников, принятых
в банк в то время, когда предлагалась услуга беспроцентного текущего
вклада.*/