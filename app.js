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
const publicIp = require('public-ip');
const geoip = require('geoip-lite');

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
app.use(bodyParser.urlencoded({ extended: false }));

//Register Session With Secred ID
app.use(session({
    secret: '3tern@1-BIack-Ro5es',
    saveUninitialized: true,
    resave: true,
}));

// Set Static Path
app.use(express.static(path.join(__dirname, 'public')));

// Global Variables
app.use(function (req, res, next) {
    res.locals.erros = null;
    next();
})

//Starts the system server
var server = app.listen(3000, function () {
    console.log('Server started on port 3000...');
});

//Secket Setup
var io = socket(server);

io.on('connection', function (socket) {
    // console.log('Made socket connection');
    
    socket.on('chat', function (data) {
        // io.sockets.emit('chat', data);
        
        sql = "INSERT INTO `matcha`.`messaging` (`sender`, `receiver`, `message`)";
        sql += " VALUES (?, ?, ?)";
        con.query(sql, [data.chat_mate, data.my_key, data.message], function (err, result) {
            if (err) {
                console.log(err);
            } else {
                io.sockets.emit('chat', data);
            }
        });
        // console.log(data.chat_mate);
    });
    
    socket.on('rate', function (data) {
        console.log(data);
        io.sockets.emit('rate', data);
        
    });
});

// Home Page
app.get('/', function (req, res) {
    if (req.session.username) {
        sql = "SELECT * FROM `matcha`.`profiles` WHERE `user_name` != ?";
        con.query(sql, [req.session.username], function (err, result) {
            if (err) {
                // console.log(err);
            }
            else {
                sql3 = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
                con.query(sql3, [req.session.username], function(err3, result3){
                    if (err3){
                        console.log(err3);
                    } else {
                        sql2 = "SELECT `receiver`, `sender` FROM `matcha`.`block` WHERE `sender` = ? OR `receiver` = ?";
                        con.query(sql2, [result3[0].unique_key, result3[0].unique_key], function(err2, result2){
                            if (err2){
                                console.log(err2);
                            } else {
                                functions.blocka(result, result2, function(call_err, response){
                                    if (call_err){
                                        console.log(call_err);
                                    } else {
                                        res.render('index', {
                                            users: response,
                                            session: req.session.username
                                        });
                                    }
                                });
                            }
                        });
                    }
                });
            }
        });
    } else {
        res.redirect('/login');
    }
});

app.get('/profiles/:unique_key', function (req, res, next) {
    if (req.session.username) {
        sql = "SELECT * FROM `matcha`.`profiles` WHERE `unique_key` = ?";
        con.query(sql, [req.params.unique_key], function (err, result) {
            if (err) {
                console.log(err);
            }
            else {
                if (result[0]){
                    if (result[0].bio = escapeHtmlReverse(result[0].bio)){
                        sql = "SELECT * FROM `matcha`.`images` WHERE `unique_key` = ?";
                        con.query(sql, [req.params.unique_key], function (err, result2) {
                            if (err) {
                                console.log(err);
                            }
                            else {
                                sql4 = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
                                con.query(sql4, [req.session.username], function(err, result4){
                                    if (err){
                                        console.log(err);
                                    } else {
                                        var my_key = result4[0].unique_key;
                                        sql = "SELECT `rating` FROM `matcha`.`rating` WHERE `rated` = ? AND `rator` = ?";
                                        con.query(sql, [req.params.unique_key, my_key], function (err2, result3) {
                                            if (err2) {
                                                console.log(err2);
                                            } else {
                                                // console.log(result3);
                                                if (result3[0]){
                                                    var rate = result3[0].rating;
                                                } else {
                                                    var rate = 0;
                                                }
                                                res.render('profiles',
                                                {
                                                    users: result,
                                                    images: result2,
                                                    session: req.session.username,
                                                    rating: rate, 
                                                    hidden_key: req.params.unique_key
                                                });
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                } else {
                    next();
                }
            }
        })
    } else {
        res.redirect('/login');
    }
});

// Profile Page
app.get('/profile', function (req, res) {
    if (req.session.username) {
        sql = "SELECT * FROM `matcha`.`profiles` WHERE `user_name` = ?";
        con.query(sql, [req.session.username], function (err, result) {
            if (err) {
                console.log(err);
            }
            else {
                result[0].bio = escapeHtmlReverse(result[0].bio);
                var user_key = result[0].unique_key;
                sql = "SELECT * FROM `matcha`.`images` WHERE `unique_key` = ?";
                con.query(sql, [user_key], function (err, result2) {
                    if (err) {
                        console.log(err);
                    }
                    else {
                        res.render('profile', {
                            images: result2,
                            users: result,
                            session: req.session.username
                        });
                    }
                })
            }
        });
    } else {
        res.redirect('/login');
    }
})

// Notifications Page
app.get('/notifications', function (req, res) {
    if (req.session.username) {
        sql = "SELECT * FROM `matcha`.`notifications` WHERE `user_name` = ?";
        con.query(sql, [req.session.username], function (err, result) {
            if (err) {
                console.log(err);
            } else {
                sql = "SELECT `user_name`, `unique_key` FROM `matcha`.`profiles`";
                con.query(sql, function (err2, result2) {
                    if (err2) {
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
app.get('/messages', function (req, res) {
    if (req.session.username) {
        sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
        con.query(sql, [req.session.username], function (err, result) {
            if (err) {
                console.log(err);
            } else {
                var key = result[0].unique_key;
                sql = "SELECT * FROM `matcha`.`messaging` WHERE `receiver` = ? OR `sender` = ?";
                con.query(sql, [key, key], function (err2, result2) {
                    if (err2) {
                        console.log(err2);
                    } else {
                        functions.double_message(result2, function (call_err, resp) {
                            if (call_err) {
                                console.log(call_err);
                            } else {
                                // console.log(resp);
                                sql = "SELECT `user_name`, `unique_key` FROM `matcha`.`profiles`";
                                con.query(sql, function (err3, result3) {
                                    if (err3) {
                                        console.log(err3);
                                    } else {
                                        res.render('messages',
                                        {
                                            session: req.session.username,
                                            messages: resp,
                                            users: result3,
                                            my_key: key
                                        });
                                    }
                                });
                            }
                        });
                        
                    }
                });
            }
        });
    } else {
        res.redirect('/login');
    }
});

app.get('/messaging/:unique_key', function (req, res, next) {
    if (req.session.username) {
        sql = "SELECT `user_name`, `unique_key`, `profile` FROM `matcha`.`profiles` WHERE `unique_key` = ? OR `user_name` = ?";
        con.query(sql, [req.params.unique_key, req.session.username], function (err, result) {
            if (err) {
                console.log(err);
            } else {
                if (result[0].user_name == req.session.username) {
                    var chat_mate = result[1].user_name;
                    var chat_key = result[1].unique_key;
                    var chat_profile = "./public/extra/profiles/" + chat_mate + "/" + result[1].profile;
                    var my_key = result[0].unique_key;
                    var my_profile = "./public/extra/profiles/" + req.session.username + "/" + result[0].profile;
                } else {
                    var chat_mate = result[0].user_name;
                    var chat_key = result[0].unique_key;
                    var chat_profile = "./public/extra/profiles/" + chat_mate + "/" + result[1].profile;
                    var my_key = result[1].unique_key;
                    var my_profile = "./public/extra/profiles/" + req.session.username + "/" + result[0].profile;
                }
                sql = "SELECT * FROM `matcha`.`messaging` WHERE `receiver` = ? AND `sender` = ?";
                sql += " OR `receiver` = ? AND `sender` = ? ORDER BY `time_log` ASC";
                con.query(sql, [my_key, req.params.unique_key, req.params.unique_key0, my_key], function (err2, result2) {
                    if (err2) {
                        console.log(err2);
                    } else {
                        // console.log(result2);
                        res.render('messaging',
                        {
                            session: req.session.username,
                            chat_mate: chat_mate,
                            chat_key: chat_key,
                            messages: result2,
                            my_key: my_key,
                            my_profile: my_profile,
                            chat_profile: chat_profile
                        });
                    }
                    res.render('messaging',
                    {
                        session: req.session.username,
                        chat_mate: chat_mate,
                        chat_key: chat_key,
                        messages: result2,
                        my_key: my_key,
                        my_profile: my_profile,
                        chat_profile: chat_profile
                    });
                }); 
            }
        })
    } else {
        res.redirect('/login');
    };
})

//Editing page
app.get('/editing:unique_key', function(req, res, next){
    if (req.session.username){
        res.render('./editing')
    } else {
        res.redirect('/')
    }
});

//Logout
app.get('/logout', function (req, res) {
    req.session.destroy(function (err) {
        if (err) {
            console.log(err);
        }
        res.redirect('/login');
    })
})

//Login Page
app.get('/login', function (req, res) {
    err = "";
    res.render('login', { result: err, session: err });
});

app.post('/login', function (req, res) {
    data = {
        username: req.body.username,
        password: req.body.password
    }
    functions.log_me_in(data, function (err, resp) {
        var empty = "";
        var error = "invalid";
        var regis = "incomplete";
        if (resp == '0') {
            res.render('./login', { result: error, session: empty });
        } else if (resp == '2'){
            req.session.hidden = functions.encryption(req.body.username);
            req.session.hidden_two = req.body.username;
            res.redirect('/register_completion');
        }
        else {
            req.session.username = req.body.username;
            console.log(req.session.username + " Logged In");
            res.redirect('/');
        }
    })
});

app.get('/register_completion', function(req, res){
    if (req.session.hidden){
        sql = "SELECT `user_name` FROM `matcha`.`profiles` WHERE `unique_key` = ?";
        con.query(sql, [req.session.hidden], function(err, result){
            if (err){
                console.log(err);
            } else {
                if (result[0]){
                    var empty = "";
                    sql2 = "SELECT `tag_name` FROM `matcha`.`tags`";
                    con.query(sql2, function(err, result2){
                        if (err){
                            console.log(err);
                        } else {
                            res.render('register_completion',
                            {
                                session: empty,
                                error: empty,
                                name: result[0].user_name,
                                tags: result2,
                                hide_me: req.session.hidden
                            });
                        }
                    })
                }
            }
        });
    } else {
        res.redirect('/login');
    }
});

app.post('/register_completion', function(req, res){
    if (req.session.hidden){
        var reg_me = {
            age: req.body.user_age,
            gender: req.body.gender,
            sexual_pref: req.body.sexual_pref,
            tag_1: req.body.tag1_select,
            tag_2: req.body.tag2_select,
            tag_3: req.body.tag3_select,
            long: req.body.coord_long,
            lat: req.body.coord_lat,
            bio: req.body.bio_box, 
            key: req.session.hidden,
        };
        console.log(req.body);
        sql = "SELECT `user_name` FROM `matcha`.`profiles` WHERE `unique_key` = ?";
        con.query(sql, [req.session.hidden], function(err, result){
            if (err){
                console.log(err);
            } else {
                if (result[0]){
                    sql2 = "SELECT `tag_name` FROM `matcha`.`tags`";
                    con.query(sql2, function(err, result2){
                        if (err){
                            console.log(err);
                        } else {
                            functions.check_my_registration(reg_me, function (error, resp){
                                var empty = "";
                                if (error){
                                    res.render('./register_completion',
                                    {
                                        error: error,
                                        session: empty,
                                        name: result[0].user_name,
                                        tags: result2,
                                        hide_me: req.session.hidden
                                    });
                                } else {
                                    req.session.hidden = "";
                                    req.session.username = req.session.hidden_two;
                                    req.session.hidden_two = "";
                                    res.redirect('/');
                                }
                            });
                        }
                    });
                }
            }
        });
    }
});

//Registration
app.get('/registration', function (req, res) {
    error = "";
    res.render('registration', { error: error, session: error });
});

app.post('/registration', function (req, res) {
    // console.log(req.body);
    var register = {
        firstname: req.body.firstname,
        lastname: req.body.lastname,
        email: req.body.email,
        username: req.body.username,
        password: req.body.password,
        mpassword: req.body.mpassword,
    }
    functions.registration_input(register, function (err, resp) {
        if (err) {
            // console.log(err);
            res.render('./registration', { error: err, session: req.session.username });
        } else {
            // console.log(resp);
            res.render('./registration', { error: resp, session: req.session.username });
        }
    });
})

//Verification Page
app.get('/verification', function (req, res) {
    data = "";
    res.render('verification', {data: data, session: data});
})

app.post('/verification', function (req, res) {
    var data = "missing";
    empty = "";
    if (!req.body.email || !req.body.code) {
        res.render('verification', { data: data, session: empty });
    }
    else {
        var data = {
            email: req.body.email,
            code: req.body.code
        }
        functions.verification_code(data, function (err, resp) {
            if (err) {
                res.render('verification', { data: err, session: empty });
            } else {
                res.render('verification', { data: resp, session: empty });
            }
        });
    }
})

//Searching For Users Page
app.get('/search', function (req, res) {
    if (req.session.username) {
        sql = "SELECT * FROM `matcha`.`tags`";
        con.query(sql, function (err, result) {
            if (err) {
                console.log(err);
            }
            else {
                sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
                con.query(sql, [req.session.username], function(err2, result2){
                    if (err2){
                        console.log(err2);
                    } else {
                        var blocker_key = result2[0].unique_key;
                        var age_low = req.query.low_age;
                        var age_max = req.query.max_age;
                        var rating = req.query.rating_select;
                        var dist = req.query.distance_select;
                        var tag_1 = req.query.tag1_select;
                        var tag_2 = req.query.tag2_select;
                        var tag_3 = req.query.tag3_select;
                        if (age_low || age_max || rating || dist || tag_1 || tag_2 || tag_3){
                            var data = {
                                age_low: age_low,
                                age_max: age_max,
                                rating: rating,
                                distance: dist,
                                tag_1: tag_1,
                                tag_2: tag_2,
                                tag_3: tag_3,
                                user: req.session.username,
                                blocker_key: blocker_key
                            };
                        } else {
                            var data = null;
                        }
                    }
                    if (data) {
                        functions.search_and_recover(data, function (call_err, resp) {
                            if (call_err) {
                                console.log(call_err);
                            } else {
                                var matches = "blah";
                                // console.log(resp);
                                res.render('search',
                                {
                                    tags: result,
                                    matches: resp,
                                    session: req.session.username,
                                });
                            }
                        });
                    } else {
                        var matches = "";
                        res.render('search',
                        {
                            tags: result,
                            matches: matches,
                            session: req.session.username
                        });
                    }
                });
            }
        })
    } else {
        res.redirect('/login');
    }
});

/****** Beginning of Backend Ajax pages here ********/

//Likes a user profile
app.post('/like', function (req, res) {
    sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
    con.query(sql, [req.body.session], function(err, result){
        if (err){
            console.log(err);
        } else {
            var my_key = result[0].unique_key;
            sql2 = "SELECT `instigator`, `receiver` FROM `matcha`.`likes` WHERE `instigator` = ? AND `receiver` = ?";
            con.query(sql2, [my_key, req.body.hidden_key], function(err2, result2){
                if (err2){
                } else {
                    var subject = "Matcha Like Alert";
                    if (result2[0]){
                        sql3 = "DELETE FROM `matcha`.`likes` WHERE `instigator` = ? AND `receiver` = ?";
                        var message = "It looks like " + req.body.session + " no longer likes you! :'(";
                    } else {
                        sql3 = "INSERT INTO `matcha`.`likes` (`instigator`, `receiver`) VALUES (?, ?)";
                        var message = "It looks like " + req.body.session + " likes you! :) Maybe you should like them back?\nLogin now and check out their profile page!\n\nhttp://localhost:3000/profiles/" + my_key;
                    }
                    con.query(sql3, [my_key, req.body.hidden_key], function(err3, result3){
                        if (err3){
                            console.log(err3);
                        } else {
                            // console.log(result3);
                            sql4 = "SELECT `matcha`.`users`.`email`, `matcha`.`users`.`user_name` FROM `matcha`.`users` INNER JOIN `matcha`.`profiles` ON `matcha`.`users`.`user_name` = `matcha`.`profiles`.`user_name` WHERE `matcha`.`profiles`.`unique_key` = '" + req.body.hidden_key + "'";
                            con.query(sql4, function(err4, result4){
                                if (err4){
                                    console.log(err4);
                                } else {
                                    var data = {
                                        email: result4[0].email,
                                        subject: subject,
                                        text: message
                                    }
                                    functions.mailman(data, function(err_mail, resp_mail){
                                        if (err_mail){
                                            console.log(err_mail);
                                        } else {
                                            console.log(resp_mail);
                                            alert('You Liked ' + result4[0].user_name);
                                        }
                                    })
                                }
                            })
                        }
                    })
                }
            })
        }
    });
});

//Blocks a user profile
app.post('/block', function (req, res) {
    sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
    con.query(sql, [req.body.session], function(err, result){
        if (err){
            console.log(err);
        } else {
            var my_key = result[0].unique_key;
            var subject = "Matcha Block Alert";
            var message = "It looks like " + req.body.session + " blocked you...\n\n Too bad, so sad... :'(";
            sql3 = "INSERT INTO `matcha`.`block` (`sender`, `receiver`, `status`) VALUES (?, ?, 0)";
            con.query(sql3, [my_key, req.body.hidden_key], function(err3, result3){
                if (err3){
                    console.log(err3);
                } else {
                    console.log("User blocked by " + req.body.session);
                    sql4 = "SELECT `matcha`.`users`.`email`, `matcha`.`users`.`user_name` FROM `matcha`.`users` INNER JOIN `matcha`.`profiles` ON `matcha`.`users`.`user_name` = `matcha`.`profiles`.`user_name` WHERE `matcha`.`profiles`.`unique_key` = ?";
                    con.query(sql4, [req.body.hidden_key], function(err4, result4){
                        if (err4){
                            console.log(err4);
                        } else {
                            
                            var data = {
                                email: result4[0].email,
                                subject: subject,
                                text: message
                            }
                            functions.mailman(data, function(err_mail, resp_mail){
                                if (err_mail){
                                    console.log(err_mail);
                                } else {
                                    console.log(resp_mail);
                                }
                            });
                        }
                    });
                }
            });
        }
    });
});

//Rating a user
app.post('/like_me', function (req, res) {
    sql = "SELECT `unique_key` FROM `matcha`.`profiles` WHERE `user_name` = ?";
    con.query(sql, [req.body.session], function(err, result){
        if (err){
            console.log(err);
        } else {
            var my_key = result[0].unique_key;
            // console.log(my_key);
            sql2 = "SELECT `rating` FROM `matcha`.`rating` WHERE `rator` = ? AND `rated` = ?";
            con.query(sql2, [my_key, req.body.hidden_key], function(err2, result2){
                if (err2){
                    console.log(err2);
                } else {
                    if (result2[0]){
                        if (req.body.love_level == result2[0].rating){
                            var love_me = 0;
                        } else {
                            var love_me = req.body.love_level;
                        }
                        // console.log(my_key);
                        // console.log(req.body.hidden_key);
                        sql3 = "UPDATE `matcha`.`rating` SET `rating` = ? WHERE `rator` = ? AND `rated` = ?";
                        con.query(sql3, [love_me, my_key, req.body.hidden_key], function(err3, result3){
                            if (err3){
                                console.log(err3);
                            } else {
                                console.log(req.body.session + " changed their rating of someone..?");
                            }
                        });
                    } else {
                        sql3 = "INSERT INTO `matcha`.`rating` (`rator`, `rated`, `rating`) VALUES (?, ?, ?)";
                        con.query(sql3, [my_key, req.body.hidden_key, req.body.love_level], function(err3, result3){
                            if (err3){
                                console.log(err3);
                            } else {
                                console.log(req.body.session + " changed their rating of someone..?");
                            }
                        });
                    }
                }
            });
        }
    });
});

//For when users attempt an invalid or broken url
app.use(function (req, res) {
    res.render('error');
});


