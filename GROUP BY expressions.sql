SELECT EXTRACT(YEAR FROM start_date) year, COUNT(*) how_many FROM employee GROUP BY EXTRACT(YEAR FROM start_date);
/* групировка на основании значений, сгенерированных выражениями */