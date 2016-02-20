close all;
clear all;
clc;
net = NeuralNetwork();

file = fopen('result.txt', 'w');
base = 'C:\Users\rajat\Pictures\imageDataset\jaffe\';
extension = '.tiff';

for i = 0:211 
    k = int2str(i);
    sample = imread((strcat(base, k, extension)));
    y = FaceExpressionDetect(i,net, sample);
    fprintf(file, ' %d -> %d \n' , i, y);
end


