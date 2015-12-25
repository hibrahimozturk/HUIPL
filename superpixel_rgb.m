function labels = superpixel_rgb(I, k)
    [slabels, numlabels] = slicmex(I,500,20);
    [rw,cl,channel] = size(I);
    meanRGB = zeros(numlabels, channel);
    %Init vectors from superpixels
    for i=0:numlabels-1
      for ch=1:3
        meanRGB(i+1,ch) = sum(sum((slabels(:,:) == i).*I(:,:,ch)))/nnz(slabels(:,:) == i);
      end
    end
    %Init points for k-mean
    c = zeros(k, channel);
    for i=1:k
        for j=1:channel
            c(i,j) = (max(meanRGB(:,j))-min(meanRGB(:,j)))*i/k;
        end
    end
    cstart = zeros(k, channel);
    dist = zeros(numlabels,k);
    
    while(sum(sum(cstart == c)) ~= k*3)
        cstart = c;
        for i=1:numlabels
            for j=1:k
                dist(i,j) = (meanRGB(i,1) - c(j,1))^2 + (meanRGB(i,2) - c(j,2))^2 + (meanRGB(i,3) - c(j,3))^2;
            end
           [m ,dist(i,1)] = min(dist(i,:));
        end

       for i=1:k
           c(i,1) = sum((dist(:,1) == i).*meanRGB(:,1))/nnz(dist(:,1) == i);
       end
    end
    
    labels = zeros(rw,cl);

    for i=0:numlabels-1
        labels(:,:) = labels(:,:) + (slabels(:,:) == i)*dist(i+1);
    end   
end