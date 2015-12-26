function featureVector = gaborFeatures(img,gaborArray)

if size(img,3) == 3     % C,heck if the input image is grayscale
    warning('The input RGB image is converted to grayscale!')
end
% img = rgb2gray(img);

gray(:,:) = (0.299)*img(:,:,1) + 0.587*img(:,:,2) + 0.114*img(:,:,3); 

% Filter input image by each Gabor filter
[u,v] = size(gaborArray);
gaborResult = cell(u,v);
for i = 1:u
    for j = 1:v
        gaborResult{i,j} = imfilter(gray, gaborArray{i,j});
    end
end
end


