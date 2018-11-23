// console.log("Log 1");

function escapeHtmlReverse(unsafe) {
    return unsafe
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'");
}

const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const session = require('express-session');
const mysql = require('mysql');
const functions = require('./controllers/functions.js');
const socket = require('socket.io');

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

var monitor;

// Init App
var app = express();

// Load View Engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// Body Parser Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

//Register Session With Secred ID
app.use(session({
    secret: '3tern@1-BIack-Ro5es',
    saveUninitialized: true,
    resave: true,
}));

// Set Static Path
app.use(express.static(path.join(__dirname, 'public')));

// Global Variables
app.use(function(req, res, next){
    res.locals.erros = null;
    next();
})

//Starts the system server
var server = app.listen(3000, function(){
    console.log('Server started on port 3000...');
});

//Secket Setup
var io = socket(server);

io.on('connection', function(socket){
    // console.log('Made socket connection');
    
    socket.on('chat', function(data){
        io.sockets.emit('chat', data);
    });
});

// Home Page
app.get('/', function(req, res){
    if (req.session.username){
        sql = "SELECT * FROM `matcha`.`profiles` WHERE `user_name` != '" + req.session.username + "'";
        con.query(sql, function (err, result) {
            if (err){
                // console.log(err);
            }
            else{
                // console.log(result);
                res.render('index', {
                    users: result,
                    session: req.session.username
                });
            }
        });
    } else {
        res.redirect('/login');
    }
    
});

app.get('/profiles/:unique_key', function(req, res, next) {
    if (req.session.username){
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
                // console.log(result);
                sql = "SELECT * FROM `matcha`.`images` WHERE `unique_key` = '";
                sql += req.params.unique_key;
                sql += "'";
                con.query(sql, function (err, result2) {
                    if (err){
                        console.log(err);
                    }
                    else{
                        // console.log(result2);
                        sql = "SELECT `rating` FROM `matcha`.`likes` WHERE `instigator` = '" + req.session.username + "'";
                        con.query(sql, function(err2, result3){
                            if (err2){
                                console.log(err2);
                            } else {
                                // console.log(result3);
                                var rate = result3.rating;
                                res.render('profiles',
                                {
                                    users: result,
                                    images: result2,
                                    session: req.session.username,
                                    rating: rate
                                });
                            }
                        })
                    }
                })
            }
        })
    } else {
        res.redirect('/login');
    }
});

// Profiles Page
app.get('/profiles', function(req, res){
    if (req.session.username){
        sql = "SELECT * FROM `matcha`.`profiles`";
        con.query(sql, function (err, result) {
            if (err){
                // console.log(err);
            }
            else{
                // Home Page
                res.render('profiles', {
                    users: result,
                    session: req.session.username
                });
            }
        });
    } else {
        res.redirect('/login');
    }
});

// Notifications Page
app.get('/notifications', function(req, res){
    if (req.session.username){
        sql = "SELECT * FROM `matcha`.`notifications` WHERE `user_name` = '" + req.session.username + "'";
        con.query(sql, function(err, result){
            if (err){
                console.log(err);
            } else {
                // console.log(result[0]);
                // console.log(result);
                sql = "SELECT `user_name`, `unique_key` FROM `matcha`.`profiles`";
                con.query(sql, function(err2, result2){
                    if (err2){
                        console.log(err2);
                    } else {
                        var check = result[0];
                        res.render('notifications',
                        {
                            session: req.session.username,
                            result: result,
                            users: result2,
                            check: check
                        });
                    }
                });
            }
        });
    } else {
        res.redirect('/login');
    }
});

// Messages Page
app.get('/messages', function(req, res){
    if (req.session.username){
        sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = '" + req.session.username + "'";
        con.query(sql, function(err, result){
            if (err){
                console.log(err);
            } else {
                var key = result[0].unique_key;
                sql = "SELECT * FROM `matcha`.`messaging` WHERE `receiver` = '" + key + "'";
                con.query(sql, function(err2, result2){
                    if (err2){
                        console.log(err2);
                    } else {
                        // console.log(result2);
                        sql = "SELECT `user_name`, `unique_key` FROM `matcha`.`profiles`";
                        con.query(sql, function(err3, result3){
                            if (err3) {
                                console.log(err3);
                            } else {
                                res.render('messages',
                                {
                                    session: req.session.username,
                                    messages: result2,
                                    users: result3
                                });
                            }
                        })
                    }
                });
            }
        });
    } else {
        res.redirect('/login');
    }
});

app.get('/messaging/:unique_key', function(req, res){
    if (req.session.username){
        sql = "SELECT `user_name`, `unique_key` FROM `matcha`.`profiles` WHERE `unique_key` = '" + req.params.unique_key + "' OR `user_name` = '" + req.session.username + "'";
        con.query(sql, function(err, result){
            if (err){
                console.log(err);
            } else {
                if (result[0].user_name == req.session.username){
                    var chat_mate = result[1].user_name;
                    var my_key = result[0].unique_key;
                } else {
                    var chat_mate = result[0].user_name;
                    var my_key = result[1].unique_key;
                }
                sql = "SELECT * FROM `matcha`.`messaging` WHERE `receiver` = '" + my_key + "' AND `sender` = '" + req.params.unique_key + "'";
                con.query(sql, function(err2, result2){
                    if (err2){
                        console.log(err2);
                    } else {
                        res.render('messaging',
                        {
                            session: req.session.username,
                            chat_mate: chat_mate,
                            messages: result2
                        });
                    }
                });
            }
        })
    } else {
        res.redirect('/login');
    };
})

// Profile Page
app.get('/profile', function(req, res){
    if (req.session.username){
        res.render('profile', {session: req.session.username});        
    } else {
        res.redirect('/login');
    }
});

//Logout
app.get('/logout', function(req, res){
    req.session.destroy(function(err){
        if (err){
            console.log(err);
        }
        res.redirect('/login');
    })
})

//Login Page
app.get('/login', function(req, res){
    err = "";
    res.render('login', {result: err, session: err});
});

app.post('/login', function(req, res){
    data = {
        username: req.body.username,
        password: req.body.password
    }
    functions.log_me_in(data, function(err, resp){
        // monitor = req.session;
        var empty = "";
        var error = "invalid";
        if (resp == '0'){
            res.render('./login', {result: error, session: empty});
        } else {
            req.session.username = req.body.username;
            // monitor.logged = data.username;
            console.log(req.session.username + " Logged In");
            res.redirect('/');
        }
    })
});

//Registration
app.get('/registration', function(req, res){
    error = "";
    res.render('registration', {error: error, session: error});
});

app.post('/registration', function(req, res){
    // console.log(req.body);
    var register = {
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        email: req.body.email,
        username: req.body.username,
        password: req.body.password,
        mpassword: req.body.mpassword,
    }
    functions.registration_input(register, function(err, resp){
        if (err){
            // console.log(err);
            res.render('./registration', {error: err, session: req.session.username});
        } else {
            // console.log(resp);
            res.render('./registration', {error: resp, session: req.session.username});
        }
    });
})

//Verification Page
app.get('/verification', function(req, res){
    data = "";
    res.render('verification');
})

app.post('/verification', function(req, res){
    var data = "missing";
    empty = "";
    if (!req.body.email || !req.body.code){
        res.render('verification', {data: data, session: empty});
    }
    else{
        var data = {
            email: req.body.email,
            code: req.body.code
        }
        functions.verification_code(data, function(err, resp){
            // console.log(err);
            // console.log(resp);
            if (err){
                res.render('verification', {data: err, session: empty});
            } else {
                res.render('verification', {data: resp, session: empty});
            }
        });
        // console.log(data);
    }
    // if (functions.verification_code())
})

//research
app.get('/search', function(req, res){
    monitor = req.session;
    if (monitor.logged){
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
                    functions.search_and_recover(data);
                }
                res.render('search', {tags: result,
                    fail: fail,
                    matches: matches,
                    session: req.session.username
                });
            }
        })
    }
    res.redirect('/login');
});

//Manages all the searching
app.post('/searcher', function(req, res){
    console.log(req.body.age_select);
})

//Beginning of Backend Ajax pages here

//Rating a user
app.post('/like_me', function(req, res){
    console.log(data.rate);
    console.log(rate);
})

//For when users attempt an invalid or broken url
app.use(function (req, res){
    res.render('error');
})


