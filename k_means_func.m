function labels = k_means_func(feature, k)

%     I = imread('bee.jpg');
%     I = im2double(I);
%     k = 3;
%     n = 3;
    [rw,cl,n] = size(feature);
    % c = cell(1,k);
    c = zeros(k,n);
    % temp = cell(1,k);
    sect = zeros(rw,cl,k);
    for i=1:k
        for j=1:n
            c(i,j) = max(max(feature(:,:,j)))*i/k; 
        end
%         c(i,:) = [i/k i/k i/k];
    end
    cstart = zeros(k,n);
    while(sum(sum(cstart == c)) ~= k*3)
    c
    cstart
    cstart = c;
    for i=1:k
        for j=1:n
            sect(:,:,i) = sect(:,:,i) + (feature(:,:,j)-c(i,j)).^2;
        end
        sect(:,:,i) = nthroot(sect(:,:,i),n);
    end


    for i=1:rw
        for j=1:cl
          [m, sect(i,j,1)] = min(sect(i,j,:));
        end
    end


    for i=1:k
        for j=1:n
            c(i,j) = sum(sum((sect(:,:,1) == i).* feature(:,:,j)))/(nnz(sect(:,:,1) == i)+1);
        end
    end
%     c(isnan(c(:,1)),:) = [];
%     k = size(c,1);
%     if(k ~= size(cstart,1))
%         cstart = zeros(k,n);
%     end
    end
    labels = sect(:,:,1);
end