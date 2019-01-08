const mysql = require('mysql');
const crypto = require('crypto');
const nodemailer = require('nodemailer');
const geoip = require('geoip-lite');
const publicIp = require('public-ip');

function mailman(data, callback){
    var mailOptions = {
        from: '', //Insert who the mail is coming from here
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

function verify_email(email){
    var pattern = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i;
    return (pattern.test(email));
}

function verify_password(password){
    var pass_strength = /^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})/;
    return (pass_strength.test(password));
}
var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: '', //Insert and email and its password here to user nodemailer
        pass: ''
    }
});

function escapeHtml(unsafe) {
    return unsafe
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

function escapeHtmlReverse(unsafe) {
    return unsafe
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'");
}

function encryption (password){
    var master_key = crypto.createHash('sha512');
    master_key.update(password);
    var hash = master_key.digest('hex');
    return hash;
}

module.exports.encryption = function (password){
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

function check_distance(distance, element, me){
    if (distance == "300+"){
        var min_distance = 50;
        var max_distance = 500000;
    } else {
        distance = distance.split("-");
        var min_distance = Number(distance[0]);
        var max_distance = Number(distance[1]);
    }
    var true_dist = element.distance;
    var check = 0;
    if (true_dist >= min_distance && true_dist <= max_distance){
        check = 1;
    }
    if (!check){
        element.unique_key = "NULL";
        return element;
    } else {
        return element;
    }
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

function check_lover(element, lovers){
    var temp = 1;
    if (lovers.gender == "Male" && lovers.sexual_pref == "Men" && element.gender == "Female"){
        temp = 0;
    }
    if (lovers.gender == "Male" && lovers.sexual_pref == "Female" && element.gender == "Men"){
        temp = 0;
    }
    if (lovers.gender == "Female" && lovers.sexual_pref == "Men" && element.gender == "Female"){
        temp = 0;
    }
    if (lovers.gender == "Female" && lovers.sexual_pref == "Female" && element.gender == "Men"){
        temp = 0;
    }
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
            sql = "SELECT * FROM `matcha`.`profiles` WHERE `user_name` = ?";
            con.query(sql, [data.user], function(err, result){
                if (err){
                    console.log(err);
                }
                else{
                    var me = {
                        long: result[0].location_long,
                        lat: result[0].location_lat,
                    }
                    var lovers = {
                        sexual_pref: result[0].sexual_pref,
                        gender: result[0].gender
                    }
                    sql2 = "SELECT `tag_name`, `unique_key` FROM `matcha`.`user_tags`";
                    con.query(sql2, function(err2, result2){
                        if (err2){
                            console.log(err2);
                        } else {
                            sql4 = "SELECT *, (ABS(ACOS(SIN((`location_lat` / 180 * 3.141592))*SIN((? / 180 * 3.141592))+COS((`location_lat` / 180 * 3.141592))*COS((? / 180 * 3.141592))*COS((? / 180 * 3.141592)-(`location_long` / 180 * 3.141592)))) * 6371) `distance` FROM `matcha`.`profiles` WHERE `user_name` != '" + data.user + "' ORDER BY `distance`";
                            con.query(sql4, [me.lat, me.lat, me.long], function(err4, result4){
                                if (err4){
                                    console.log(err4);
                                } else {
                                    
                                    result4.forEach(element => {
                                        if (result3[0]){
                                            element = check_blocker(element, result3);
                                        }
                                        element = check_age(data.age_low, data.age_max, element);
                                        element = check_lover(element, lovers);
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
                                        if (data.distance != -1){
                                            element = check_distance(data.distance, element, me);
                                        }
                                        if (element.bio){
                                            element.bio = escapeHtmlReverse(element.bio);
                                        }
                                    });
                                    callback(null, result4);
                                }
                            })
                            
                        }
                    })
                }
            });
        }
    });
}

module.exports.registration_input = function (register, callback){
    if (!register.firstname || !register.lastname || !register.email || !register.username || !register.password || !register.mpassword){
        callback("missing", null);
    }
    if (register.password !== register.mpassword){
        callback("mismatch", null);
    }
    if (!verify_password(register.password)){
        callback("Weak Password", null);
    }
    if (!verify_email(register.email)){
        callback("Invalid Email", null);
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
            sql = "SELECT `email` FROM `matcha`.`verification` WHERE `email` = ?";
            con.query(sql, [register.email], function(err, result){
                if (err){
                    console.log(err);
                } else {
                    if (result[0] && result[0].email == register.email){
                        exists = 1;
                    }
                    if (exists){
                        callback("exists", null);
                    } else {
                        var uni_key = encryption(register.username);
                        var pass = encryption(register.password);
                        sql = "INSERT INTO `matcha`.`users` (`unique_key`, `user_name`, `email`, `password`, `verified`)";
                        sql += "VALUES (?, ?, ?, ?, '0');";
                        con.query(sql, [uni_key ,register.username, register.email, pass], function(err, result){
                            if (err){
                                console.log(err);
                            } else {
                                console.log("User " + register.username + " Added to users table");
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
                                        
                                        var key = encryption(register.username);
                                        sql = "INSERT INTO `matcha`.`profiles` (`unique_key`, `user_name`, `first_name`, `last_name`) VALUES (?, ?, ?, ?)";
                                        con.query(sql, [key, register.username, register.firstname, register.lastname], function(err, result){
                                            if (err){
                                                console.log(err);
                                            } else {
                                                console.log("User Initial Profile Complete");
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
                                });
                            }
                        });   
                    }
                }
            })
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
            console.log('Email sent to ' + data.email);
            callback(null, "sent");
        }
    });
}

module.exports.check_my_registration = function (reg_me, callback){
    var errors = {
        essential: "",
        tags: "",
    };
    if (!reg_me.age || !reg_me.gender || !reg_me.sexual_pref || reg_me.age < 18 || reg_me.age > 60){
        errors.essential = "essentials";
        callback(errors, null);
    }
    if (!reg_me.tag_1 || !reg_me.tag_2 || !reg_me.tag_3){
        errors.tags = "tags";
        callback(errors, null);
    }
    if (!reg_me.long || !reg_me.lat){
        publicIp.v4().then(ip => {
            var geo = geoip.lookup(ip);
            reg_me.long = geo.ll[1];
            reg_me.lat = geo.ll[1];
            var tag_list = reg_me.tag_1 + ", " + reg_me.tag_2 + ", " + reg_me.tag_3;
            var sql = "UPDATE `matcha`.`profiles` SET `age` = ?, `gender` = ?, `sexual_pref` = ?, `bio` = ?, `interests` = ?, `location_lat` = ?, `location_long` = ? WHERE `matcha`.`profiles`.`unique_key` = ?";
            con.query(sql, [reg_me.age, reg_me.gender, reg_me.sexual_pref, reg_me.bio, tag_list, reg_me.lat, reg_me.long, reg_me.key], function(err, result){
                if (err){
                    console.log(err);
                } else {
                    console.log('User profile table updated succesfully');
                    sql2 = "UPDATE `matcha`.`users` SET `verified` = 1 WHERE `matcha`.`users`.`unique_key` = ?";
                    con.query(sql2, [reg_me.key], function(err2, res2){
                        if (err2){
                            console.log(err2);
                        } else {
                            sql3 = "INSERT INTO `matcha`.`images` (`unique_key`) VALUES (?)";
                            con.query(sql3, [reg_me.key], function(err3, result3){
                                if (err3){
                                    console.log(err3);
                                }else {
                                    console.log('User verification succesful');
                                    callback(null, "success");
                                }
                            });
                        }
                    });
                }
            });
        });
    } else {
        var tag_list = reg_me.tag_1 + "," + reg_me.tag_2 + "," + reg_me.tag_3;
        var sql = "UPDATE `matcha`.`profiles` SET `age` = ?, `gender` = ?, `sexual_pref` = ?, `bio` = ?, `interests` = ?, `location_lat` = ?, `location_long` = ? WHERE `matcha`.`profiles`.`unique_key` = ?";
        con.query(sql, [reg_me.age, reg_me.gender, reg_me.sexual_pref, reg_me.bio, tag_list, reg_me.lat, reg_me.long, reg_me.key], function(err, result){
            if (err){
                console.log(err);
            } else {
                console.log('User profile table updated succesfully');
                sql2 = "UPDATE `matcha`.`users` SET `verified` = 1 WHERE `matcha`.`users`.`unique_key` = ?";
                con.query(sql2, [reg_me.key], function(err2, res2){
                    if (err2){
                        console.log(err2);
                    } else {
                        sql3 = "INSERT INTO `matcha`.`images` (`unique_key`) VALUES (?)";
                        con.query(sql3, [reg_me.key], function(err3, result3){
                            if (err3){
                                console.log(err3);
                            }else {
                                console.log('User verification succesful');
                                callback(null, "success");
                            }
                        });
                    }
                });
            }
        });
    }
}

module.exports.forget_me = function(email, callback){
    if (!email){
        callback('Invalid', null);
    } else {
        sql = "SELECT `email`, `user_name` FROM `matcha`.`users` WHERE `email` = ? AND `verified` != 0";
        con.query(sql, [email], function (err, result){
            if (err){
                console.log(err);
            } else {
                if (result[0]){
                    var number = (Math.floor(Math.random() * 2831) + 1) * (Math.floor(Math.random() * 79425) + 1);
                    var code = encryption(number.toString()).substr(8, 36);
                    sql = "INSERT INTO `matcha`.`verification` (`email`, `code`) VALUES (?, ?)";
                    con.query(sql, [email, code], function(err2, result2){
                        if (err2){
                            console.log(err2);
                        } else {
                            data = {
                                subject: "Matcha Forgot Password",
                                email: email,
                                text: "Click on the following link\n\nhttp://localhost:3000/reset_2/" + code,
                            }
                            mailman(data, function(err, resp){
                                if (err){
                                    console.log(err); 
                                } else {
                                    console.log(resp);
                                    callback(null, "Success");
                                }
                            })
                        }
                    });
                } else {
                    callback('Invalid', null);
                }
            }
        });
    }
}

module.exports.update_password = function(data, callback){
    if (!data.password || !data.mpassword || !data.email){
        callback("Invalid", null);
    } else {
        if (!verify_password(data.password)){
            callback("weak password", null);
        }
        data.password = encryption(data.password);
        data.mpassword = encryption(data.mpassword);
        if (data.password != data.mpassword){
            callback("Invalid", null);
        } else {
            console.log(data);
            var sql3 = "SELECT * FROM `matcha`.`verification` WHERE `email` = ?";
            con.query(sql3, [data.email], function(err3, result3){
                if (err3){
                    console.log(err3);
                } else {
                    
                    if (result3[0]){
                        var sql2 = "DELETE FROM `matcha`.`verification` WHERE `email` = ?";
                        con.query(sql2, [data.email], function(err2, result2){
                            if (err2){
                                console.log(err2);
                            } else {
                                console.log("Verification Entry Deleted");
                                var sql = "UPDATE `matcha`.`users` SET `password` = ? WHERE `email` = ?";
                                con.query(sql, [data.password, data.email], function(err, result){
                                    if (err){
                                        console.log(err);
                                    } else {
                                        console.log("User Details Updated");
                                        callback(null, "Success");
                                    }
                                });
                            }
                        });
                    } else{
                        callback("Invalid", null);
                    }
                }
            });
        }
    }
}

module.exports.update_profile = function(prof_data, callback){
    if (!prof_data.firstname && !prof_data.lastname && !prof_data.email && !prof_data.password && !prof_data.mpassword && !prof_data.bio
        && !prof_data.age && !prof_data.gender && !prof_data.sexual_pref && !prof_data.tag_1 && !prof_data.tag_2 && !prof_data.tag_3){
            callback("Unchanged", null);
        } else if (prof_data.password && !verify_password(prof_data.password)){
            callback("Password Is Not Strong Enough", null);
        } else if (prof_data.password && prof_data.mpassword && prof_data.password !== prof_data.mpassword){
            callback("Passwords Do Not Match", null);
        } else if (prof_data.email && !verify_email(prof_data.email)){
            callback("Please Enter Correct Email Address", null);
        }
        sql = "SELECT * FROM `matcha`.`profiles` INNER JOIN `matcha`.`users` ON `profiles`.`user_name`=`users`.`user_name` WHERE `users`.`user_name` = ?"
        con.query(sql, [prof_data.session], function(err, result){
            if (err){
                console.log(err);
            } else {
                if (!prof_data.firstname){
                    prof_data.firstname = result[0].first_name;
                }
                if (!prof_data.lastname){
                    prof_data.lastname = result[0].last_name;
                }
                if (!prof_data.age){
                    prof_data.age = result[0].age;
                }
                if (!prof_data.sexual_pref){
                    prof_data.sexual_pref = result[0].sexual_pref;
                }
                if (!prof_data.bio){
                    prof_data.bio = result[0].bio;
                } else {
                    prof_data.bio = escapeHtml(prof_data.bio);
                }
                if (!prof_data.email){
                    prof_data.email = result[0].email;
                }
                if (!prof_data.password){
                    prof_data.password = result[0].first_name;
                } else {
                    prof_data.password = encryption(prof_data.password);   
                }
                if (!prof_data.gender){
                    prof_data.gender = result[0].gender;
                }
                if (!prof_data.long || !prof_data.lat){
                    prof_data.long = result[0].location_long;
                    prof_data.lat = result[0].location_lat;
                }
                sql2 = "SELECT * FROM `matcha`.`user_tags` WHERE `unique_key` = ?";
                con.query(sql2, [result[0].unique_key], function(err2, result2){
                    if (err2){
                        console.log(err2);
                    } else {
                        if (!prof_data.tag_1){
                            prof_data.tag_1 = result2[0].tag_name;
                        }
                        if (!prof_data.tag_2){
                            prof_data.tag_2 = result2[1].tag_name;
                        }
                        if (!prof_data.tag_3){
                            prof_data.tag_3 = result2[2].tag_name;                        
                        }
                        var interests = prof_data.tag_1 + ", " + prof_data.tag_2 + ", " +prof_data.tag_3;
                        sql3 = "UPDATE `matcha`.`profiles` SET `first_name` = ?, `last_name` = ?, `age` = ?, `gender` = ?, `sexual_pref` = ?, `location_lat` = ?, `location_long` = ?, `bio` = ?, `interests` = ? WHERE `unique_key` = ?";
                        con.query(sql3, [prof_data.firstname, prof_data.lastname, prof_data.age, prof_data.gender, prof_data.sexual_pref, prof_data.lat, prof_data.long, prof_data.bio, interests, result[0].unique_key], function (err3, result3){
                            if (err3){
                                console.log(err3);
                            } else {
                                console.log(result3);
                                sql4 = "UPDATE `matcha`.`user_tags` SET `tag_name` = ? WHERE `tag_name` = ? AND `unique_key` = ?";
                                con.query(sql4, [prof_data.tag_1, result2[0].tag_name, result[0].unique_key], function(err4, result4){
                                    if (err4){
                                        console.log(err4);
                                    } else {
                                        console.log(result4);
                                        var sql5 = "UPDATE `matcha`.`user_tags` SET `tag_name` = ? WHERE `tag_name` = ? AND `unique_key` = ?";
                                        con.query(sql5, [prof_data.tag_2, result2[1].tag_name, result[0].unique_key], function(err5, result5){
                                            if (err5){
                                                console.log(err5);
                                            } else {
                                                console.log(result5);
                                                var sql6 = "UPDATE `matcha`.`user_tags` SET `tag_name` = ? WHERE `tag_name` = ? AND `unique_key` = ?";
                                                con.query(sql6, [prof_data.tag_3, result2[2].tag_name, result[0].unique_key], function(err6, result6){
                                                    if (err6){
                                                        console.log(err6);
                                                    } else {
                                                        console.log(result6);
                                                        callback("Update Successfull");
                                                    }
                                                });
                                            }
                                        });
                                    }
                                });
                            }
                        });
                    }
                })
            }
        });
    }
    
    module.exports.block_messages = function(users, my_key, callback){
        users.forEach(element => {
            var block_sql = "SELECT * FROM `matcha`.`block` WHERE (`sender` = ? AND `receiver` = ?) OR (`sender` = ? AND `receiver` = ?)";
            con.query(block_sql, [my_key, element.unique_key, element.unique_key, my_key], function(block_err, block_res){
                if (block_err){
                    console.log(block_err);
                } else {
                    if (block_res[0]){
                        element.unique_key = "NULL";
                    }
                }
            })
        });
        callback(null, users);
    }
