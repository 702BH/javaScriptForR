// script.js
$(document).on('shiny:busy', function(event){

    // retrieve the gif
    var title = document.getElementById("loading");


    // make it visible
    title.style.visibility = "visible";

});

$(document).on('shiny:idle', function(event) {
    var gif = document.getElementById("loading")

    // hide gif
    gif.style.visibility = "hidden";
});