SELECT C.hacker_id, H.name, COUNT(challenge_id) AS cnt
FROM Hackers AS H
JOIN Challenges AS C ON H.hacker_id = C.hacker_id
GROUP BY C.hacker_id, H.name
HAVING cnt = (
	SELECT 
	COUNT(challenge_id)
	FROM Challenges
	GROUP BY hacker_id
	ORDER BY COUNT(*) DESC
	LIMIT 1
) OR 
cnt NOT IN (
	SELECT COUNT(challenge_id)
	FROM Challenges
	GROUP BY hacker_id
	HAVING hacker_id <> C.hacker_id
)
ORDER BY cnt DESC, C.hacker_id;
