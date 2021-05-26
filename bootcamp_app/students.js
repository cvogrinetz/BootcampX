const { Pool } = require('pg');
const args = process.argv.slice(2);
arg1 = args[0]
arg2 = args[1]

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
SELECT students.id, students.name, cohorts.name as cohort
FROM students
INNER JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '${arg1}%'
LIMIT ${arg2};  
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.id} and was in the ${user.cohort} cohort`);
  })
}).catch(err => console.error('query error', err.stack));