SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population)) AS AveragePopulation
FROM Country
INNER JOIN City ON Country.Code = City.CountryCode
GROUP BY Country.Continent;
