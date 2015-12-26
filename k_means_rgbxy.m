function out = k_means_rgbxy(I,k)
    [rw, cl, c] = size(I);
    feature = zeros(rw,cl,5);
    feature(:,:,1:3) = I(:,:,:);
    b = linspace(1,cl,cl);
    y = b;
    for i=1:rw-1
        y = [y;b]; 
    end

    b = linspace(1,rw,rw);
    x = b;
    for i=1:cl-1
        x = [x;b];
    end
    feature(:,:,4) = y(:,:)./cl;
    feature(:,:,5) = x(:,:)'./rw;
    out = k_means_func(feature,k);
end