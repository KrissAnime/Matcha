var mysql = require('mysql');
const crypto = require('crypto');

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

module.exports.registration_input = function (register){
    if (!register.firstname || !register.lastname || !register.email || !register.username || !register.password || !register.mpassword){
        return "missing";
    }
    if (register.password !== register.mpassword){
        return "mismatch";
    }
    var pass = encryption(register.password);
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
            if (exists){
                return "exists";
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
                        return "pass";
                    }
                });
                
            }
        }
    });
    
    
}