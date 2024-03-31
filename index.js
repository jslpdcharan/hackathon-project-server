const express = require('express');
const app = express();
const cors =require("cors");
const bodyParser = require('body-parser')
const mysql = require('mysql2');

// Change database credentials
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "admin",
    port: "3306",
    database: "hackathondb",
});
app.use(cors());
app.use(express.json())
app.use(bodyParser.urlencoded({extended: true}))

// To fetch the events in the database
app.get('/api/get_events', (req, res) => {
    let sql = "SELECT e_name, e_time, e_location, e_description, e_date, e_contact_details FROM events";
    const { date } = req.query;

    if (date) {
        sql += " WHERE e_date = ?";
    }

    sql += " ORDER BY e_date, e_time;";
    console.log(sql);
    db.query(sql, [date], (err, result) => {
        if (err) {
            res.status(500).send({ error: err.message });
        } else {
            res.send(result);
        }
    });
});

// Admin page username and password authentication
app.post('/api/admin_login', (req, res) => {
    const { username, password } = req.body;

    const sql = "SELECT username, password FROM admin WHERE username = ? AND password = ?";

    db.query(sql, [username, password], (err, result) => {
        if (err) {
            console.error(err);
            return res.status(500).send({ success: false, message: 'An error occurred. Please try again later.' });
        }

        if (result && result.length > 0) {
            return res.send({ success: true });
        } else {
            return res.send({ success: false });
        }
    });
});

// Get the Committe members information
app.get('/api/committe_members', (req, res) => {
    let sql = "select m_name, m_email,m_level, m_role from members;";
    db.query(sql, (err, result) => {
        if (err) {

            res.status(500).send({ error: err.message });
        } else {
            res.send(result);
        }
    });
});

// Get the Alumini members information
app.get('/api/alumni_members', (req, res) => {

    const sql = "select a_full_name,a_year_of_enrollment  from alumini order by a_year_of_enrollment;";

    db.query(sql, (err, result) => {
        if (err) {
            res.status(500).send({ error: err.message });
        } else {
            res.send(result);
        }
    });
});

// To update the record status in the property for the admin page
app.post("/api/update_committee_member",(req,res) =>{
    const name = req.body.name;
    const email = req.body.email;
    const level = req.body.level;
    const old_email = req.body.old_email;
    const sql_query = "UPDATE members SET m_name = ?, m_email = ?, m_level = ? WHERE m_email = ?";
    const values = [name, email, level, old_email];
    db.query(sql_query, values, (err, result) => {
        console.log(sql_query,values);
        if(err) {
            console.log("Error");
            res.status(500).send({ error: err.message });
        } else {
            console.log("No Error");
            res.send(null);
        }
    });
});

// To fetch the responsibilities based on the role
app.get('/api/get_responsibilities', (req, res) => {
    const role = req.query.role;
    const sql = "select m_responsibility from roles where m_role = 'President';";
    db.query(sql, [role], (err, result) => {
        console.log(sql,role);
        if (err) {
            res.status(500).send({ error: err.message });
        } else {
            res.send(result);
        }
    });
});

app.listen(3001,() =>
{
    console.log("Running on the port 3001")
});
