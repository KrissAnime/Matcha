var mysql = require('mysql');

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

function twin(user_tag){
    var max = user_tag.length;
    var start = 0;
    var next = 1;
    
    user_tag.sort();
    while (next <= max){
        if (user_tag[start] == user_tag[next]){
            user_tag[next] = "NULL";
        }
        start++;
        next++;
    }
    return user_tag;
}

sql = "SELECT `interests` FROM `matcha`.`profiles`";
con.query(sql, function (err, result) {
    if (err){
        console.log(err);
    }
    else{
        var tag_list = "";
        result.forEach(element => {
            tag_list += element.interests;
            tag_list += ",";
        });
        // console.log(tag_list);
        tag_list = tag_list.split(",");
        tag_list = twin(tag_list);
        var max = tag_list.length - 1;
        var index = 0;
        while (index < max){
            var tag = tag_list[index].trim();
            if (tag != "NULL" && tag.length >= 3){
                sql = "INSERT INTO `matcha`.`tags` (`tag_name`)";
                sql += "VALUES ('" + tag + "')";
                con.query(sql, function(err, result){
                    if (err){
                        console.log(err);
                    }
                    else{
                        console.log("Tag Added!");
                    }
                })
            }
            index++;
        }
    }
});

