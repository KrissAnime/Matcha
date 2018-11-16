// console.log("Log 1");

var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');
// require('./models/config');
const url = require('url');
var mysql = require('mysql');

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

// Init App
var app = express();

// Load View Engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Body Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

// Set Static Path
app.use(express.static(path.join(__dirname, 'public')));

// Global Variables
app.use(function(req, res, next){
    res.locals.erros = null;
    next();
})

// Express Validator Middleware
app.use(expressValidator({
    errorFormatter: function(param, msg, value) {
        var namespace = param.split('.'),
        root = namespace.shift(),
        formParam = root;
        
        while (namespace.length){
            form += '[' + namespace.shift() + ']';
        }
        return {
            param   : formParam,
            msg     : msg,
            value   : value
        }
    }
}));

// console.log("Log 1");
sql = "SELECT * FROM `matcha`.`profiles`";
con.query(sql, function (err, result) {
    if (err){
        // console.log(err);
    }
    else{
        // Home Page
        app.get('/', function(req, res){
            res.render('index', {
                users: result
            });
        });
    }
});

app.get('/profiles/:unique_key', function(req, res, next) {
    sql = "SELECT * FROM `matcha`.`profiles` WHERE `unique_key` = '";
    sql += req.params.unique_key;
    sql += "'";
    // console.log('before render');
    con.query(sql, function (err, result) {
        if (err){
            console.log(err);
        }
        else {
            // console.log(result);
            res.render('profiles', {users: result});
            // next();
            console.log("after render");
        }
    })
});

// Profiles Page
app.get('/profiles', function(req, res){
    sql = "SELECT * FROM `matcha`.`profiles`";
    con.query(sql, function (err, result) {
        if (err){
            // console.log(err);
        }
        else{
            // Home Page
            res.render('index', {
                users: result
            });
        }
    });
});

// Notifications Page
app.get('/notifications', function(req, res){
    res.render('profile');
});

// Messages Page
app.get('/messages', function(req, res){
    res.render('messages');
});

// Profile Page
app.get('/profile', function(req, res){
    res.redirect('/');
});

//Browsing
app.get('/browse', function(req, res){
    res.render('browse');
});

//Registration
app.get('/registration', function(req, res){
    res.render('registration');
});

//research
app.get('/research', function(req, res){
    res.render('research');
});

//Login Page
app.get('/login', function(req, res){
    res.render('login');
});

//Starts the system server
app.listen(3000, function(){
    console.log('Server started on port 3000...');
});
