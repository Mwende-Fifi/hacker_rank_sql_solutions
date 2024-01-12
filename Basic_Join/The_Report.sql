SELECT 
CASE WHEN Grades.Grade < 8 THEN "NULL"
ELSE
	Students.Name END
	AS Name
	Grades.Grade,
	Students.Marks
	FROM Students, Grades
	WHERE Students.Marks >= Grades.Min_Mark AND Students.Marks <= Grades.Max_Mark
	ORDER BY Grades.Grade DESC,
	CASE WHEN Grades.Grade >= 8 THEN Students.Name END ASC,
		CASE WHEN Grades.Grade < 8 THEN Students.Marks END ASC;
