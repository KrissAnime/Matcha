//Make socket connection
var socket = io.connect('http://localhost:3000/');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var modalImg = document.getElementById("modal_image");
var modal = document.getElementById('myModal');
var photo = document.getElementById('photo');

function blowup(event, img){
    var img = img.replace(/ /g, "\\ ");
    modal.style.display = "block";
    modalImg.style.backgroundImage = 'url(' + img + ')';
    photo.value = event.target.id.slice(-1);
    console.log(photo.value);
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
    modal.style.display = "none";
}