function labels = k_means_rgb(I, k)
% k = 4;
[rw,cl,ch] = size(I);
% c = cell(1,k);
c = zeros(k,3);
temp = cell(1,k);
sect = zeros(rw,cl,k);
for i=1:k
    c(i,:) = [rand rand rand];
end
cstart = zeros(k,3);
while(sum(sum(cstart == c)) ~= k*3)
cstart = c;
for i=1:k
    temp{i}(1:rw, 1:cl, 1) = c(i,1);  
    temp{i}(1:rw, 1:cl, 2) = c(i,2);
    temp{i}(1:rw, 1:cl, 3) = c(i,3);
    
    
    temp{i}(:,:,:) = temp{i}(:,:,:) - I(:,:,:); 
    
    sect(:,:, i) = nthroot((temp{i}(:,:,1).^2+temp{i}(:,:,2).^2+ temp{i}(:,:,3).^2),3);
end


for i=1:rw
    for j=1:cl
      [m, sect(i,j,1)] = min(sect(i,j,:));
    end
end


for i=1:k
    c(i,1) = sum(sum((sect(:,:,1) == i).* I(:,:,1)))/nnz(sect(:,:,1) == i);
    c(i,2) = sum(sum((sect(:,:,1) == i).* I(:,:,2)))/nnz(sect(:,:,1) == i);
    c(i,3) = sum(sum((sect(:,:,1) == i).* I(:,:,3)))/nnz(sect(:,:,1) == i);
end

end
labels = sect(:,:,1)./k;
end