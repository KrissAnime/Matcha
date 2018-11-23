//Make connection

var socket = io.connect('http://localhost:3000/');

//Query DOM
var message = document.getElementById('message');
var handle = document.getElementById('handle');
var output = document.getElementById('output');
var send_message = document.getElementById('send_message');

//Emit Event
var random = "text";
send_message.addEventListener('click', function(){
    socket.emit('chat', {
        message: random,
        handle: handle.value
    })
})

//Listen for events
socket.on('chat', function(data){
    output.innerHTML += '<p><strong>' + data.handle + ':</strong>' + data.message + '</p>';
});