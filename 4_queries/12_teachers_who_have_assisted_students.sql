SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
INNER JOIN teachers ON teachers.id = teacher_id
INNER JOIN students ON students.id = student_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;