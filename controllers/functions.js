var mysql = require('mysql');
const crypto = require('crypto');
var nodemailer = require('nodemailer');
var geoip = require('geoip-lite');

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'krissultimatum@gmail.com',
        pass: 'lifeisahighway18'
    }
});

function escapeHtmlReverse(unsafe) {
    return unsafe
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'");
}

function encryption(password){
    var master_key = crypto.createHash('sha512');
    master_key.update(password);
    var hash = master_key.digest('hex');
    return hash;
}

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

module.exports.blocka = function(result, result2, callback){
    var clear = 1;
    result.forEach(element => {
        result2.forEach(element2 => {
            if (element.unique_key == element2.receiver || element.unique_key == element2.sender){
                clear = 0;
            }
        });
        if (!clear){
            element.unique_key = "NULL";
            clear = 1;
        }
    });
    callback(null, result);
}

module.exports.log_me_in = function(data, callback){
    sql = "SELECT `user_name`, `password`, `verified` FROM `matcha`.`users`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        } else {
            var verified = '0';
            var pass = encryption(data.password);
            result.forEach(element => {
                if (element.user_name == data.username && element.password == pass && element.verified == 1){
                    verified = '1';
                } else if (element.user_name == data.username && element.password == pass && element.verified == 2){
                    verified = '2';
                }
            });
            callback(null, verified);
        }
    });
}

module.exports.verification_code = function(data, callback){
    sql = "SELECT * FROM `matcha`.`verification`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        } else {
            var verified = 0;
            result.forEach(element => {
                if (element.email === data.email && element.code === data.code){
                    verified = 1;
                }
            });
            if (!verified){
                callback ("fail",null);
            }
            sql = "UPDATE `matcha`.`users` SET `verified` = '2' WHERE `users`.`email` = ?";
            con.query(sql, [data.email], function(err, result){
                if (err){
                    console.log(err);
                } else {
                    console.log("Users table updated");
                    sql = "DELETE FROM `matcha`.`verification` WHERE `verification`.`email` = ?";
                    con.query(sql, [data.email], function(err, result){
                        if (err){
                            console.log(err);
                        } else {
                            console.log("Verification table updated");
                            callback (null,"pass");
                        }
                    });
                }
            });
        }
    });
}

function check_age(age_low, age_max, element){
    var temp = 0;    
    if (element.age >= age_low && element.age <= age_max){
        temp = 1;
    }
    if (!temp){
        element.unique_key = "NULL";
        return element;
    } else {
        return element;
    }
}

function check_fame(fame_rating, element){
    var temp = 0;
    var new_fame_rating = fame_rating.split('-');
    var fame_rating_low = Number(new_fame_rating[0]);
    var fame_rating_high = Number(new_fame_rating[1]);
    if (element.fame_rating >= fame_rating_low && element.fame_rating <= fame_rating_high){
        temp = 1
    }
    if (!temp){
        element.unique_key = "NULL";
        return element;
    } else {
        return element;
    }
}

function check_tag(tag, tag_result, old_element){
    
    var temp = 0;
    tag_result.forEach(new_element => {
        if (tag.trim() == new_element.tag_name.trim() && old_element.unique_key == new_element.unique_key){
            temp = 1;
        }
    });
    if (!temp){
        old_element.unique_key = "NULL";
        return old_element;
    } else {
        return old_element;
    }
};

function check_blocker(element, result3){
    var temp = 1;
    result3.forEach(element3 => {
        if (element3.receiver == element.unique_key || element3.sender){
            temp = 0;
        }
    });
    if (!temp){
        element.unique_key = "NULL";
        return element;
    } else {
        return element;
    }
}

module.exports.search_and_recover = function (data, callback){
    
    if(!data.age_low || data.age_low < 18){
        data.age_low = 18;
    }
    if(!data.age_max || data.age_max > 60){
        data.age_max = 60;
    }
    if (data.age_low && data.age_max && data.age_low > data.age_max){
        var temp = data.age_max;
        data.age_max = data.age_low;
        data.age_low = temp;
    }
    if(!data.rating){
        data.rating = -1;
    }
    if(!data.distance){
        data.distance = -1;
    }
    if(!data.tag_1){
        data.tag_1 = -1;
    }
    if(!data.tag_2){
        data.tag_2 = -1;
    }
    if(!data.tag_3){
        data.tag_3 = -1;
    }
    sql2 = "SELECT `receiver`, `sender` FROM `matcha`.`block` WHERE `sender` = ? OR `receiver` = ?";
    con.query(sql2, [data.blocker_key, data.blocker_key], function(err3, result3){
        if (err3){
            console.log(err2);
        } else {
            sql = "SELECT * FROM `matcha`.`profiles` WHERE `user_name` != '" + data.user + "'";
            con.query(sql, function(err, result){
                if (err){
                    console.log(err);
                }
                else{
                    sql2 = "SELECT `tag_name`, `unique_key` FROM `matcha`.`user_tags`";
                    con.query(sql2, function(err2, result2){
                        if (err2){
                            console.log(err2);
                        } else {
                            result.forEach(element => {
                                if (result3[0]){
                                    element = check_blocker(element, result3);
                                }
                                element = check_age(data.age_low, data.age_max, element);
                                if (data.rating != -1){
                                    element = check_fame(data.rating, element);
                                }
                                if (data.tag_1 != -1){
                                    element = check_tag(data.tag_1, result2, element);
                                }
                                if (data.tag_2 != -1){
                                    element = check_tag(data.tag_2, result2, element);                    
                                }
                                if (data.tag_3 != -1){
                                    element = check_tag(data.tag_3, result2, element);                         
                                }
                                element.bio = escapeHtmlReverse(element.bio);
                            });
                            callback(null, result);
                        }
                    })
                }
            });
        }
    });
}

module.exports.registration_input = function (register, callback){
    console.log(register);
    if (!register.firstname || !register.lastname || !register.email || !register.username || !register.password || !register.mpassword){
        callback("missing", null);
    }
    if (register.password !== register.mpassword){
        callback("mismatch", null);
    }
    sql = "SELECT `email`, `user_name` FROM `matcha`.`users`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        } else {
            var exists = 0;
            result.forEach(element => {
                if (element.user_name === register.username || element.email === register.email){
                    exists = 1;
                }
            });
            // console.log(exists);
            if (exists){
                callback("exists", null);
            } else {
                // console.log('code');
                sql = "INSERT INTO `matcha`.`users` (`user_name`, `email`, `password`, `verified`)";
                sql += "VALUES (?, ?, ?, '0');";
                con.query(sql, [register.username, register.email, pass], function(err, result){
                    if (err){
                        console.log(err);
                    } else {
                        console.log("User " + register.username + " Added to users table");
                    }
                });
                var code = encryption(register.username + register.email);
                sql = "INSERT INTO `matcha`.`verification` (`email`, `code`)";
                sql += "VALUES (?, ?)";
                con.query(sql, [register.email, code], function(err, result){
                    if (err){
                        console.log(err);
                    } else {
                        console.log("User verification code added to verification table");
                        var mailOptions = {
                            from: 'KrissAdmin@matcha.com',
                            to: register.email,
                            subject: 'Matcha Registration',
                            text: 'Congratulations for signing up to our Matcha website,\nGo to the following link http://localhost:3000/verification and enter te following code to complete registration:\n' + code
                        };
                        
                        transporter.sendMail(mailOptions, function(error, info){
                            if (error) {
                                console.log(error);
                            } else {
                                console.log('Email sent: ' + info.response);
                                callback(null, "pass");
                            }
                        });
                    }
                });
                
            }
        }
    });
}

module.exports.double_message = function(data, callback){
    var max = data.length;
    var start = 0;
    var next = start + 1;
    
    data.forEach(element => {
        while (next < max){
            if (element.sender == data[next].sender){
                data[next].sender = "NULL";
            }
            next++;
        }
        start++;
        next = start + 1;
        // console.log(data[next].sender);
    });
    callback(null, data);
}

module.exports.mailman = function(data, callback){
    var mailOptions = {
        from: 'KrissAdmin@matcha.com',
        to: data.email,
        subject: data.subject,
        text: data.text
    };
    
    transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
            callback(null, "sent");
        }
    });
}