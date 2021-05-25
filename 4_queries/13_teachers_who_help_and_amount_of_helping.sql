SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests.created_at) as total_assistances
FROM assistance_requests
INNER JOIN teachers ON teachers.id = teacher_id
INNER JOIN students ON students.id = student_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teachers.name;