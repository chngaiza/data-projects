1.	What’s the relationship between sessions length and essay grades?

select 
  s.student_id, 
  s.session_length_min, 
  er.grade 
from essays e 
inner join sessions s 
  on e.id = s.essay_id
inner join essay_results er 
  on e.id = er.essay_id
order by 3 desc;

2.	What courses typically receive the highest grades?
  
with essay_results as (
  select 
    essay_id,
    student_id,
    course_id,
    grade,
    date_of_results
  from essay_results 
  ),

course as (
  select 
    id,
    course_name,
    details
  from course 
  ),

select 
  course.id, 
  course.course_name, 
  avg(essays.session_length_min) as avg_session_length,
  avg(essay_results.grade) as avg_grade
from essays 
left join course 
  on essays.course_id = course.id
left join essay_results 
  on essays.id = essay_results.essay_id
group by 1,2 
order by 3 desc;

