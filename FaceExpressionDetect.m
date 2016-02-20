function [Y] = FaceExpressionDetect( number, net, sample )
bounds = faceDetect(sample);
sample = imcrop(sample,bounds);
sample = imresize(sample , [100,100]);
gaborArray = gaborFilterBank(3,4,39,39);
images = 'sample';
featureVector = gaborFeatures(sample, images, gaborArray, 6 ,6);


matrix = featureVector';

Y=sim(net, matrix); % sim is used to test the network on an image here testing is done on trained images

if( Y < 1.5 && Y >= 0.5 )
    disp('It is a HAPPY IMAGE');
   % fprintf(file, '%d It is a HAPPY IMAGE' , number );
elseif( Y<2.5 && Y >=1.5 )
    disp('It is a SAD IMAGE');
    %fprintf(file, ' %d It is a SAD IMAGE' , number);
elseif( Y<3.5 && Y >=2.5 )
    disp('It is a FEAR IMAGE');
    %fprintf(file, ' %d It is a FEAR IMAGE', number );
elseif( Y<4.5 && Y >=3.5 )
    disp('It is a SURPRISE IMAGE');
    %fprintf(file, '%d It is a SURPRISE IMAGE' , number)
end 


end

