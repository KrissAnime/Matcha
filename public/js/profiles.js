var socket = io.connect('http://localhost:3000/');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var modalImg = document.getElementById("modal_image");
var modal = document.getElementById('myModal');
var new_notifcations = document.getElementById('new_notifications');

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

socket.on('visit', function(data){
    if (data.their_key == my_key){
        new_notifcations.innerHTML += "<p>Your profile was visited</p>"
    }
});
