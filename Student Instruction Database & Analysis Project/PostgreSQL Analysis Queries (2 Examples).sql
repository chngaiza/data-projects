1.	What’s the relationship between sessions length and essay grades?

SELECT s.student_id, s.session_length_min, er.grade 
FROM essays AS e 
INNER JOIN sessions AS s ON e.id = s.essay_id
INNER JOIN essay_results AS er ON e.id = er.essay_id;

2.	What courses typically receive the highest grades?

SELECT course.id, course.course_name, essay_results.grade
FROM essays, course, essay_results
WHERE essays.id = essay_results.essay_id
AND course.id = essays.id
GROUP BY course.id, course.course_name, essay_results.grade
ORDER BY essay_results.grade;
