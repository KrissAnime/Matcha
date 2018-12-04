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
var my_key = document.getElementById('my_key').value;

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

function rating(event){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like_me",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){  
        }
    }
    var val = event.target.id.slice(-1);
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key+"&love_level="+val);
}

function like_me(){
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("POST","/like",true);
    xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    xmlhttp.onreadystatechange=function(){
        if (xmlhttp.readyState== 4 && xmlhttp.status== 200){
            // if (like_button.classList.contains('btn', 'btn-warning')){
            //     like_button.classList.remove('btn', 'btn-warning');
            //     like_button.classList.add('btn', 'btn-success');
            //     location.reload();
            // }
            // else{
            //     like_button.classList.remove('btn', 'btn-success');
            //     like_button.classList.add('btn', 'btn-warning');
            //     location.reload();
            // }
            // header('Location: /profiles/'+my_key)
            // // Location('./profiles/'+my_key);
            // location.reload(true);
        }
    }
    xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key);
}

function block_me(){
    if (confirm("Are you sure you want to block this user? This action cannot be undone!")){
        xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","/block",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState== 4 && xmlhttp.status== 200){
                console.log("User was blocked");
                window.location.replace("/");
            }
        }
        xmlhttp.send("session="+session_name+"&hidden_key="+hidden_key);
    }
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