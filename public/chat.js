//Make socket connection

var socket = io.connect('http://localhost:3000/');

//Query DOM
var message = document.getElementById('message');
var handle = document.getElementById('handle');
var output = document.getElementById('chat_bubble');
var send_message = document.getElementById('send_message');
var chat_mate = document.getElementById('chat_mate');
//Emit Event
send_message.addEventListener('click', function(){
    socket.emit('chat', {
        message: message.value,
        handle: handle.value,
        chat_mate: chat_mate
    })
})

//Listen for events
socket.on('chat', function(data){
    output.innerHTML += '<br><div id="chat_bubble"><p><strong>' + data.handle + ': </strong>' + data.message + '</p></div><br>';
});