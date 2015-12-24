I = imread('bee.jpg');
I = im2double(I);

labels = k_means_rgb(I, 3);


