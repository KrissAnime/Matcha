var mysql = require('mysql');
const crypto = require('crypto');
var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'krissultimatum@gmail.com',
        pass: 'lifeisahighway18'
    }
});

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

module.exports.log_me_in = function(data, callback){
    sql = "SELECT `user_name`, `password` FROM `matcha`.`users`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        } else {
            var verified = 0;
            var pass = encryption(data.password);
            result.forEach(element => {
                if (element.user_name == data.username && element.password == pass){
                    callback(null, "login");
                }
            })
            callback("invalid", null);
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
            sql = "UPDATE `matcha`.`users` SET `verified` = '1' WHERE `users`.`email` = '" + data.email + "'";
            con.query(sql, function(err, result){
                if (err){
                    console.log(err);
                } else {
                    console.log("Users table updated");
                    sql = "DELETE FROM `matcha`.`verification` WHERE `verification`.`email` = '" + data.email + "'";
                    con.query(sql, function(err, result){
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

module.exports.search_and_recover = function (data){
    console.log(data);
    
    sql = "SELECT * FROM `matcha`.`profiles`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        }
        else{
            result.forEach(element => {
                var check = element.tag
            });
        }
    })
    // return "Testing";
    //Select all user profiles
    //Search for tags that match
    //Return the query result of search
}

module.exports.registration_input = function (register, callback){
    console.log(register);
    if (!register.firstname || !register.lastname || !register.email || !register.username || !register.password || !register.mpassword){
        callback("missing", null);
    }
    if (register.password !== register.mpassword){
        callback("mismatch", null);
    }
    var pass = encryption(register.password);
    sql = "SELECT `email`, `user_name` FROM `matcha`.`users`";
    con.query(sql, function(err, result){
        if (err){
            console.log(err);
        } else {
            var exists = 0;
            result.forEach(element => {
                console.log(element.user_name);
                console.log(register.username);
                console.log(element.email);
                console.log(register.email);
                if (element.user_name === register.username || element.email === register.email){
                    exists = 1;
                }
            });
            console.log(exists);
            if (exists){
                callback("exists", null);
            } else {
                console.log('code');
                
                sql = "INSERT INTO `matcha`.`users` (`user_name`, `email`, `password`, `verified`)";
                sql += "VALUES ('" + register.username + "', '" + register.email + "', '" + pass + "', '0');";
                con.query(sql, function(err, result){
                    if (err){
                        console.log(err);
                    } else {
                        console.log("User " + register.username + " Added to users table");
                    }
                });
                var code = encryption(register.username + register.email);
                sql = "INSERT INTO `matcha`.`verification` (`email`, `code`)";
                sql += "VALUES ('" + register.email + "', '" + code + "')";
                con.query(sql, function(err, result){
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