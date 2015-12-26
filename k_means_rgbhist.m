function out = k_means_rgbhist(I,k,s)
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

 
end