// //Make socket connection
var socket = io.connect('http://localhost:3000/');
var new_notifcations = document.getElementById('new_notifications');
var my_key = document.getElementById('my_key');
var num_notices = document.getElementById('new_notices');
var new_message = document.getElementById('new_message');

// //Listen for events

socket.on('visit', function(data){
    if (data.their_key == my_key.value){
        num_notices.innerHTML = data.notices;
        num_notices.classList.remove('far', 'fa-bell');
        num_notices.classList.add('fas', 'fa-bell');
    }
});

socket.on('rate', function(data){
    if (data.their_key == my_key.value){
        num_notices.innerHTML = data.notices;
        num_notices.classList.remove('far', 'fa-bell');
        num_notices.classList.add('fas', 'fa-bell');
    }
});

socket.on('block', function(data){
    if (data.their_key == my_key.value){
        num_notices.innerHTML = data.notices;
        num_notices.classList.remove('far', 'fa-bell');
        num_notices.classList.add('fas', 'fa-bell');
    }
});

socket.on('like', function(data){
    if (data.their_key == my_key.value){
        num_notices.innerHTML = data.notices;
        num_notices.classList.remove('far', 'fa-bell');
        num_notices.classList.add('fas', 'fa-bell');
    }
});

socket.on('new_message', function(data){
    if (data.my_key == my_key.value){
        console.log(data.messages);
        new_message.innerHTML = data.messages;
        num_notices.classList.remove('far', 'fa-comments');
        num_notices.classList.add('fas', 'fa-comments');
    }
});
