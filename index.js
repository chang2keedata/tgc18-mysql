const express = require('express');
const hbs = require('hbs');
const wax = require('wax-on');
const mysql2 = require('mysql2/promise');

const app = express();
app.set('view engine', 'hbs');
wax.on(hbs.handlebars);
wax.setLayoutPath('./views/layouts')

async function main() {
    const connection = await mysql2.createConnection({
        'host': 'process.env.DB_HOST',
        'user': 'process.env.DB_USER',
        'database': 'process.env.DATABASE',
        'password': 'process.env.PASSWORD'
    })

    app.get('/actors', async function(req,res){
        const[actors] = await connection.execute("SELECT * FROM actors")

        res.render('actor.hbs',{
            'actors': actors
        })
    })

    // array destructing
    // let f = ['apple','banana','cranberry'];
    // let a = f[0];
    // let b = f[1];
    // let c = f[2];
    // =============
    // function getFruits(){
    //     return ['apple','banana','cranberry']
    // }
    // let [a] = getFruits();
    // console.log(a)

    app.get('/staff', async function(req,res){
        const[staff] = await connection.execute("SELECT staff_id, first_name, last_name, email FROM staff")

        res.render('staff.hbs',{
            'staff': staff
        })
    })

    app.get('/search', async function(req,res){
        let query = "SELECT * from actors WHERE 1";
        let [actors] = await connection.execute(query);

        res,render('search',{
            'actors': actors
        })
    })
}



app.use(express.urlencoded({
    'extended': false
}))

app.listen(3000, function(){
    console.log('server has started')
})