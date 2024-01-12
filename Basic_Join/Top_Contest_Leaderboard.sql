SELECT hacker_id, name, COALESCE(SUM(max_score), 0) AS total_score
FROM (
	SELECT h.hacker_id, h.name, MAX(s.score) AS max_score
	FROM Hackers h
	LEFT JOIN Submissions s ON h.hacker_id = s.hacker_id
	GROUP BY h.hacker_id, h.name, s.challenge_id
) AS max_scores
GROUP BY hacker_id, name
HAVING total_score > 0
ORDER BY total_score DESC, hacker_id;
