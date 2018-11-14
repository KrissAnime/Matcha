var mysql = require('mysql');
var db_name = "matcha";

var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

con.connect(function(err) {
    if (err){
        console.log(err);
    }
    else{
        console.log("Connected!");
    }
    
    con.query("CREATE DATABASE IF NOT EXISTS ".db_name, function (err, result) {
      if (err){
        console.log(err);
      }
      else{
        console.log("Database created");
      }
    });
  });

// var con = mysql.createConnection({
//     host: "localhost",
//     user: "root",
//     password: "Asuka2016",
//     database: db_name
// });

// con.connect(function(err) {
//     if (err) throw err;
//     console.log("Connected!");
//     var sql = "CREATE TABLE IF NOT EXISTS users";
//     sql += "(user_id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,";
//     sql += " firstname VARCHAR(30) NOT NULL ,";
//     sql += " lastname VARCHAR(30) NOT NULL ,";
//     sql += " username VARCHAR(50) NOT NULL ,";
//     sql += " email VARCHAR(50) NOT NULL ,";
//     sql += " password VARCHAR(255) NOT NULL,";
//     sql += " verified INT (1),";
//     sql += " profile VARCHAR(40))";

//     con.query(sql, function (err, result) {
//       if (err) throw err;
//       console.log("Table created");
//     });
//   });
