SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
	SELECT 
	MIN(coins_needed)
	FROM Wands w2
	JOIN Wands_Property wp2 on w2.code = wp2.code
	WHERE wp2.is_evil = 0
	AND wp.age = wp2.age
	AND w.power = w2.power
)
ORDER BY w.power DESC,wp.age DESC;
