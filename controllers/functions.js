var mysql = require('mysql');

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

function search_and_recover(data){
    //Select all user profiles
    //Search for tags that match
    //Return the query result of search
}