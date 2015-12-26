function out = k_means_rgbhist(I,k,s)
% I = imread('bee.jpg');
% k = 5;
% I = im2double(I);
[slabels, numlabels] = slicomex(I,s);

[rw,cl,channel] = size(I);

rgbHists = zeros(numlabels, 1, 256*channel);

for i=0:numlabels-1
    rgbHists(i+1, 1, 1:256) = imhist(nonzeros(double(slabels(:,:) == i).*I(:,:,1)));
    rgbHists(i+1, 1, 257:256*2) = imhist(nonzeros(double(slabels(:,:) == i).*I(:,:,2)));
    rgbHists(i+1, 1, 256*2+1:256*3) = imhist(nonzeros(double(slabels(:,:) == i).*I(:,:,3)));
end

labels = k_means_func(rgbHists, k);

out = zeros(rw,cl);
    for i=0:numlabels-1
        out(:,:) = out(:,:) + (slabels(:,:) == i)*labels(i+1);
    end   

% 
% c = zeros(k,channel,256);
% for i=1:k
%     for j=1:channel
%               c(i,j,:) =  randi([0 256], 1,256);
% %         for t=1:256
% %             c(i,j,t) = int32(max((rgbHists(:,j,t)))*i/k);
% %         end
%     end
% end
% 
% 
% cstart = zeros(k, channel, 256);
% dist = zeros(numlabels, k);
% 
% for i=1:numlabels
%     for j=1:k
%         dist(i,j) = sum((rgbHists(i,1,:) - c(j,1,:)).^2 + (rgbHists(i,2,:) - c(j,2,:)).^2 + (rgbHists(i,3,:) - c(j,3,:)).^2);
%     end
%     [m, dist(i,1)] = min(dist(i,:));
% end
% 
end