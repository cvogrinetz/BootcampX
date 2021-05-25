SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (assistance_requests.completed_at - assistance_requests.started_at) as duration
FROM assistance_requests
INNER JOIN students ON students.id = student_id
INNER JOIN teachers ON teachers.id = teacher_id
INNER JOIN assignments ON assignments.id = assignment_id
GROUP BY teachers.name, students.name, assignments.name,assistance_requests.completed_at, assistance_requests.started_at
ORDER BY duration ASC;