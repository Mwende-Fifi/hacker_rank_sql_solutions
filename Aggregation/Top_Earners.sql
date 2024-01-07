SELECT (salary * months) AS max_earnings, COUNT(*)
FROM Employee
WHERE (salary * months) = (SELECT MAX(salary * months)
	                  FROM Employee)
                          GROUP BY max_earnings;
