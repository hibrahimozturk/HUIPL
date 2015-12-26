I = imread('bee.jpg');
I = im2double(I);

% labels = k_means_rgb(I, 3);

labels = superpixel_rgb(I,15, 5000);
% [rw cl c] = size(I);
% feature = zeros(rw,cl,5);
% feature(:,:,1:3) = I(:,:,:);
% k = linspace(1,cl,cl);
% y = k;
% for i=1:rw-1
%     y = [y;k]; 
% end
% 
% k = linspace(1,rw,rw);
% x = k;
% for i=1:cl-1
%     x = [x;k];
% end
% feature(:,:,4) = y(:,:)./cl;
% feature(:,:,5) = x(:,:)'./rw;
% out = k_means_func(feature,5);
