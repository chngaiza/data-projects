1.	What’s the relationship between sessions length and essay grades?

select 
  s.student_id, 
  s.session_length_min, 
  er.grade 
from essays e 
inner join sessions s 
  on e.id = s.essay_id
inner join essay_results er 
  on e.id = er.essay_id;

2.	What courses typically receive the highest grades?
  
select 
  course.id, 
  course.course_name, 
  essay_results.grade
from essays, course, essay_results
where essays.id = essay_results.essay_id
and course.id = essays.id
group by course.id, course.course_name, essay_results.grade
order by essay_results.grade desc;


select 
  course.id, 
  course.course_name, 
  essay_results.grade
from essays, course, essay_results
where essays.id = essay_results.essay_id
and course.id = essays.id
group by course.id, course.course_name, essay_results.grade
order by essay_results.grade desc;
