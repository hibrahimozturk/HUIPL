function labels = k_means_func(feature, k)

    [rw,cl,n] = size(feature);
    c = zeros(k,n);
    sect = zeros(rw,cl,k);
    for i=1:k
        for j=1:n
            c(i,j) = max(max(feature(:,:,j)))*i/k; 
        end
    end
    cstart = zeros(k,n);
    while(sum(sum(cstart == c)) ~= k*n)
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
    end
    labels = sect(:,:,1);
end