SELECT count(assistance_requests.started_at) as total_assistances, teachers.name as name
FROM teachers
INNER JOIN assistance_requests ON teachers.id = teacher_id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;