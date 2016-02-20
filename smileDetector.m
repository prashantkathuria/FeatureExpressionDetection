image = imread('C:\Users\rajat\Pictures\imageDataset\jaffe\34.tiff')
faceDetector = vision.CascadeObjectDetector('FrontalFaceCART');
box = step(faceDetector, image );
croppedImage = imcrop(facecrop, [1 floor(2*box(4)/3 box(3) ceil(box(4))]);
mouthcrop = imcrop(croppedImage, )