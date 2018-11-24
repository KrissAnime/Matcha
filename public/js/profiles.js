//Make socket connection
var socket = io.connect('http://localhost:3000/');

//Variables for my varias queries
// var hidden_key = document.getElementById('hidden_key').value;
// var session_name = document.getElementById('session').value;


$('#profile_heart1').hover(function(){
    $(this).removeClass("far fa-star").addClass("fas fa-star");
}, function(){
    $(this).removeClass("fas fa-star").addClass("far fa-star");
});

$('#profile_heart2').hover(function(){
    $(this).removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart1').removeClass("far fa-star").addClass("fas fa-star");
}, function(){
    $(this).removeClass("fas fa-star").addClass("far fa-star");
    $('#profile_heart1').removeClass("fas fa-star").addClass("far fa-star");                                                        
});

$('#profile_heart3').hover(function(){
    $('#profile_heart1').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart2').removeClass("far fa-star").addClass("fas fa-star");
    $(this).removeClass("far fa-star").addClass("fas fa-star");
}, function(){
    $(this).removeClass("fas fa-star").addClass("far fa-star");
    $('#profile_heart1').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart2').removeClass("fas fa-star").addClass("far fa-star");                                                        
});

$('#profile_heart4').hover(function(){
    $('#profile_heart1').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart2').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart3').removeClass("far fa-star").addClass("fas fa-star");
    $(this).removeClass("far fa-star").addClass("fas fa-star");
}, function(){
    $('#profile_heart1').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart2').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart3').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $(this).removeClass("fas fa-star").addClass("far fa-star");
});

$('#profile_heart5').hover(function(){
    $('#profile_heart1').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart2').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart3').removeClass("far fa-star").addClass("fas fa-star");
    $('#profile_heart4').removeClass("far fa-star").addClass("fas fa-star");
    $(this).removeClass("far fa-star").addClass("fas fa-star");
}, function(){
    $('#profile_heart1').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart2').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart3').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $('#profile_heart4').removeClass("fas fa-star").addClass("far fa-star");                                                        
    $(this).removeClass("fas fa-star").addClass("far fa-star");
});

// Get the image and insert it inside the modal - use its "alt" text as a caption
var modalImg = document.getElementById("modal_image");
var captionText = document.getElementById("caption");
var modal = document.getElementById('myModal');
var like_button = document.getElementById('like_button');
var block_button = document.getElementById('block_button');
var hidden_key = document.getElementById('hidden_key').value;
var session_name = document.getElementById('session_name').value;


function blowup(event, img){
    var img = img.replace(/ /g, "\\ ");
    modal.style.display = "block";
    modalImg.style.backgroundImage = 'url(' + img + ')';
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
	
// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}

var love_level_1 = document.getElementById('profile_heart1');
    love_level_2 = document.getElementById('profile_heart2'),
    love_level_3 = document.getElementById('profile_heart3'),
    love_level_4 = document.getElementById('profile_heart4'),
    love_level_5 = document.getElementById('profile_heart5');

love_level_1.onclick = function(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level=1");
}

love_level_2.onclick = function(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level=2");
}

love_level_3.onclick = function(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level=3");
}

love_level_4.onclick = function(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level=4");
}

love_level_5.onclick = function(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level=5");
}

like_button.onclick = function() {
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
            console.log("Liked");
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key);
}

block_button.onclick = function() {
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/block",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
            console.log("Blocked");
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key);
}

// $('#profile_heart1').click(function(){
//     var heart = 1;
//     socket.emit('rate', {
//         hidden_key: hidden_key,
//         session_name: session_name,
//         heart: heart
//     });
// });

// $('#profile_heart2').click(function(){
//     var heart = 2;
//     socket.emit('rate', {
//         hidden_key: hidden_key,
//         session_name: session_name,
//         heart: heart
//     });
// });

// $('#profile_heart3').click(function(){
//     var heart = 3;
//     socket.emit('rate', {
//         hidden_key: hidden_key,
//         session_name: session_name,
//         heart: heart
//     });
// });

// $('#profile_heart4').click(function(){
//     var heart = 4;
//     socket.emit('rate', {
//         hidden_key: hidden_key,
//         session_name: session_name,
//         heart: heart
//     });
// });

// $('#profile_heart5').click(function(){
//     var heart = 5;
//     socket.emit('rate', {
//         hidden_key: hidden_key,
//         session_name: session_name,
//         heart: heart
//     });
// });

// socket.on('rate', function(data){
//     location.reload();
// })