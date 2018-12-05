//Make socket connection
var socket = io.connect('http://localhost:3000/');
var new_notice = document.getElementById('new_notices');
var new_message = document.getElementById('new_message');

//Listen for events
socket.on('rate', function(data){
    console.log('rate');
    new_notice.classList.remove('far', 'fa-bell');
    new_notice.classList.add('fas', 'fa-bell');
});

window.onload() = function() {
    socket.on('chat', function(data){
        console.log('chat');
        new_message.classList.remove('far', 'fa-comments');
        new_message.classList.add('fas', 'fa-comments');
    });
    
    socket.on('visit', function(data){
        console.log('visti');
        new_notice.classList.remove('far', 'fa-bell');
        new_notice.classList.add('fas', 'fa-bell');
    });
    
    socket.on('notice', function(data){
        console.log('notice');
        new_notice.classList.remove('fas', 'fa-bell');
        new_notice.classList.add('far', 'fa-bell');
    });
}
