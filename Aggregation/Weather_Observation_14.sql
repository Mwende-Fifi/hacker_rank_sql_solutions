SELECT TRUNCATE(MAX(LAT_N), 4) AS maximum_latitude
FROM STATION
WHERE LAT_N < 137.2345;
