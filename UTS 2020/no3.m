function result = no3(aug_matrix)
[m,n] = size(aug_matrix);
if m~=n-1, error('Matriks koefisien harus persegi'); end

for k = 1:n-2
    for i = k+1:n-1
        factor = aug_matrix(i,k)/aug_matrix(k,k);
        aug_matrix(i,k:n) = aug_matrix(i,k:n)-factor*aug_matrix(k,k:n);
    end
end

result = zeros(n-1,1);
result(n-1) = aug_matrix(n-1,n)/aug_matrix(n-1,n-1);
disp(result)
for i = n-1:-1:1
    result(i) = (aug_matrix(i,n)-aug_matrix(i,i+1:n-1)*result(i+1:n-1))/aug_matrix(i,i);
end

% logam = 20
% plastik = 40
% karet = 60