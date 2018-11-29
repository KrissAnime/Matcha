var mysql = require('mysql');

var con = mysql.createConnection({
    socketPath: '/goinfre/cbester/Desktop/mamp_server/mysql/tmp/mysql.sock',
    host: "localhost",
    user: "root",
    password: "Asuka2016"
});

function add_my_tag(element, callback){
    var temp_tags = element.interests.split(",");
    var num_tags = temp_tags.length;
    var index = 0;
    while (index < num_tags){
        sql = "INSERT INTO `matcha`.`user_tags` (`unique_key`, `tag_name`) VALUES ('" + element.unique_key + "', '" + temp_tags[index] + "')";
        con.query(sql, function(err, result){
            if (err){
                console.log(err);
            } else {
                console.log('Search Tag Added!');
            }
        });
        index++;

    }
    callback(null, "Success");
}

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

sql = "SELECT `interests`, `unique_key` FROM `matcha`.`profiles`";
con.query(sql, function (err, result) {
    if (err){
        console.log(err);
    }
    else{
        var tag_list = "";
        result.forEach(element => {
            add_my_tag(element, function(call_err, resp){
                if (call_err){
                    console.log(call_err);
                } else {
                    tag_list += element.interests;
                    tag_list += ",";
                }
            });
        });
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

