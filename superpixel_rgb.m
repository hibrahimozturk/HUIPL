function out = superpixel_rgb(I, k, n)
[slabels, numlabels] = slicmex(I,n,20);
[rw,cl,channel] = size(I);
meanRGB = zeros(numlabels,1, channel);
%Init vectors from superpixels
for i=0:numlabels-1
    for ch=1:3
        meanRGB(i+1,1,ch) = sum(sum((slabels(:,:) == i).*I(:,:,ch)))/nnz(slabels(:,:) == i);
    end
end
labels = k_means_func(meanRGB,k);
out = zeros(rw,cl);

for i=0:numlabels-1
    out(:,:) = out(:,:) + (slabels(:,:) == i)*labels(i+1);
end   
end