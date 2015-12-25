I = imread('bee.jpg');
I = im2double(I);

% labels = k_means_rgb(I, 4);

labels = superpixel_rgb(I,10);
