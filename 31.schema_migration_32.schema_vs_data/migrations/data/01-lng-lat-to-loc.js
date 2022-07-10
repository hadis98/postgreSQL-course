const pg = require('pg');

const pool = new pg.Pool({
    host: 'localhost',
    port: 5432,
    database: 'socialnetwork',
    user: 'postgres',
    password: '1234'
});

pool.query(`
    UPDATE posts 
    SET loc = POINT(lng,lat)
    WHERE loc IS NULL;
`).then(() => {
    console.log('Update complete');
    pool.end(); //disconnect from db
}).catch((err) => console.log(err.message));