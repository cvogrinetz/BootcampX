SELECT count(assistance_requests.started_at) as total_assistances, students.name as name
FROM students
INNER JOIN assistance_requests ON students.id = student_id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;