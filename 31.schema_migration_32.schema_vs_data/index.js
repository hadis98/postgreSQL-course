const express = require('express');

const pg = require('pg');

const pool = new pg.Pool({
    host: 'localhost',
    port: 5432,
    database: 'socialnetwork',
    user: 'postgres',
    password: '1234'
});

pool.query('select 1+1').then((res) => console.log(res));

const app = express();
app.use(express.urlencoded({ extended: true }));

app.get('/posts', async(req, res) => {
            const { rows } = await pool.query(`
        select * from posts;
    `);

            res.send(`
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>lng</th>
                <th>lat</th>
            </tr>
        </thead>
        <tbody>
            ${rows.map(row => {
        return `
                    <tr>
                        <td>${row.id}</td>
                        <td>${row.loc.x}</td>
                        <td>${row.loc.y}</td>
                    </tr>
                `
    }).join('')}
        </tbody>
    </table>
    <form method="post">
    <h3>create posts</h3>
    <div>
        <label for="lng">Lng</label>
        <input name="lng" />
    </div>
    <div>
        <label for="lat">Lat</label>
        <input name="lat" />
    </div>
    <button type="submit">Create</button>
    </form>
    `);
});


app.post('/posts', async (req, res) => {
    console.log(req.body);
    const { lng, lat } = req.body;
    await pool.query(
        'INSERT INTO posts(loc) VALUES($1);'
        , [`(${lng},${lat})`]
    );

    res.redirect('/posts');
});


app.listen(3005, () => {
    console.log('listening on port 3005');
});