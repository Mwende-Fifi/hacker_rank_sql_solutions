SELECT S.hacker_id, H.name
FROM Submissions AS S
JOIN Challenges AS C ON S.challenge_id = C.challenge_id
JOIN DIfficulty AS D ON C.difficulty_level = D.difficulty_level
JOIN Hackers AS H ON S.hacker_id = H.hacker_id
WHERE S.score = D.score
GROUP BY S.hacker_id, H.name
HAVING COUNT(DISINCT C.challenge_id) > 1
ORDER BY COUNT(DISINCT C.challenge_id) DESC, S.hacker_id ASC;
