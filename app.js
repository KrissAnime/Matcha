// console.log("Log 1");

function escapeHtmlReverse(unsafe) {
    return unsafe
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'");
}

var express = require('express');
var path = require('path');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');
// require('./models/config');
const url = require('url');
var mysql = require('mysql');
require('./controllers/functions');

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
app.get('/', function(req, res){
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
            result[0].bio = escapeHtmlReverse(result[0].bio);
            console.log(result);
            sql = "SELECT * FROM `matcha`.`images` WHERE `unique_key` = '";
            sql += req.params.unique_key;
            sql += "'";
            con.query(sql, function (err, result2) {
                if (err){
                    console.log(err);
                }
                else{
                    // console.log(result2);
                    res.render('profiles', {users: result, images: result2});
                }
            })
            // next();
            // console.log("after render");
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

//Registration
app.get('/registration', function(req, res){
    res.render('registration');
});

//research
app.get('/search', function(req, res){
    sql = "SELECT * FROM `matcha`.`tags`";
    con.query(sql, function (err, result){
        if (err){
            console.log(err);
        }
        else{
            var age = req.query.age_select;
            var rating = req.query.rating_select;
            var dist = req.query.distance_select;
            var tag_1 = req.query.tag1_select;
            var tag_2 = req.query.tag2_select;
            var tag_3 = req.query.tag3_select;
            var errors = 6;
            // console.log(age)
            var data = {
                age: age,
                rating: rating,
                distance: dist,
                tag_1: tag_1,
                tag_2: tag_2,
                tag_3: tag_3
            };
            if (!age){
                errors--;
                data.age = 1;
            }
            if (!rating){
                errors--;
                data.rating = 1;
            }
            if (!dist){
                errors--;
                data.distance = 1;
            }
            if (!tag_1){
                errors--;
                data.tag_1 = 1;
            }
            if (!tag_2){
                errors--;
                data.tag_2 = 1;
            }
            if (!tag_3){
                errors--;
                data.tag_3 = 1;
            }
            var fail = "False";
            if (!errors){
                fail = "True";
            }
            matches = "";
            if (fail == "False"){
                
                matches = search_and_recover(data);
            }
            // errors = errors.split(",");
            console.log(fail);
            // console.log(age);
            // console.log(rating);
            // console.log(dist);
            // console.log(tag_1);
            // console.log(tag_2);
            // console.log(tag_3);
            res.render('search', {tags: result, fail: fail, matches: matches});
        }
    })
});

//Manages all the searching
app.post('/searcher', function(req, res){
    console.log(req.body.age_select);
})

//Login Page
app.get('/login', function(req, res){
    res.render('login');
});

//Starts the system server
app.listen(3000, function(){
    console.log('Server started on port 3000...');
});

app.use(function (req, res){
    res.render('error');
})
