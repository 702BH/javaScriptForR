// Initialise the image classifier method with MobileNet
const classifier = ml5.imageClassifier('MobileNet', modelLoaded);
// when the model is loaded
function modelLoaded(){
    console.log('Model Loaded!');
}

Shiny.addCustomMessageHandler('classify', function(data){
    // Classify bird
    classifier.classify(
        document.getElementById(data), (err, results) =>{
            Shiny.setInputValue(data + "_classification:ml5.class", results);
        }
    );
});