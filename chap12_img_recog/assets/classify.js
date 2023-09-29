// mandatory callback function
function modelLoaded() {
    console.log('Model Loaded!');
}

// Initialise the Image Classifier method with MobileNet
const classifier = ml5.imageClassifier('MobileNet', modelLoaded);

