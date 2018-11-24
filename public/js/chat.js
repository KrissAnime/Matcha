//Make socket connection
var socket = io.connect('http://localhost:3000/');

//Query DOM
var message = document.getElementById('message');
var handle = document.getElementById('handle');
var output = document.getElementById('output');
var send_message = document.getElementById('send_message');
var chat_mate = document.getElementById('chat_mate');
var my_key = document.getElementById('my_key');

//Emit Event
send_message.addEventListener('click', function(){
    socket.emit('chat', {
        message: message.value,
        handle: handle.value,
        chat_mate: chat_mate.value,
        my_key: my_key.value
    });
    message.value = "";
})

//Listen for events
socket.on('chat', function(data){
    output.innerHTML += '<div id="chat_bubble"><p><strong>' + data.handle + ': </strong>' + data.message + '</p></div><br>';
});