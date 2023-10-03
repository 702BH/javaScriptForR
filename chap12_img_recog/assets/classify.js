// mandatory callback function
function modelLoaded() {
    console.log('Model Loaded!');
}

// Initialise the Image Classifier method with MobileNet
const classifier = ml5.imageClassifier('MobileNet', modelLoaded);

Shiny.addCustomMessageHandler('classify', function(data){
    // Classify bird
    classifier.classify(
        document.getElementById("bird"), (err, results) => {
            Shiny.setInputValue("classification", results)
        }
    );
});