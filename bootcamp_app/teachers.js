const { Pool } = require('pg');
const args = process.argv.slice(2);
arg1 = args[0];
arg2 = args[1];

const pool = new Pool ({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
INNER JOIN teachers ON teachers.id = teacher_id
INNER JOIN students ON students.id = student_id
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name;
`;

const cohortName = arg1;
const values = [`%${cohortName}%`];

pool
  .query(queryString, values)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teacher}`)
    })
  })
  .catch(err => console.error('query error', err.stack));