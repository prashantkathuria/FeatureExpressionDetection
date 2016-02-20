function [ net ] = NeuralNetwork()
n=5;
m=4;

BASE_URL = 'images\';
EXTENSN  = '.tiff';

finalFeatures = [];
targ = []

images = {'Happy', 'Sad', 'Fear', 'Surprise'};
for i = 1:m
    NEW_URL = strcat(BASE_URL, images{i}, '\');
    for j = 1:n
        targ = [targ; i];
        img = imread(strcat(NEW_URL, int2str(j), EXTENSN));
        % img = rgb2gray(img); 
        bounds = faceDetect(img);
        img = imcrop(img, bounds);
        img = imresize(img, [100, 100]);

        gaborArray = gaborFilterBank(3,4,39,39);  % Generates the Gabor filter bank
        featureVector = gaborFeatures(img, images{i}, gaborArray,6, 6);   % Extracts Gabor feature vector, 'featureVector', from the image, 'img'.

        finalFeatures = [finalFeatures; featureVector];
    end
end

disp('==========================================');

p=finalFeatures.'; % transposed feature vector
t=targ.'; % transposed output vector

net=newff(minmax(p),[5 size(t,1)],{'logsig' 'purelin'});  % newff initialize the network  5 is no. of hidden layers keep it 1 or 2 for ur code

% network parameters
net.trainFcn = 'traingdx';
net.trainParam.epochs = 5000;
net.trainParam.goal = .01;

net = train(net,p,t); % to train the initialized network and net contains the trained network     
        
        


end

