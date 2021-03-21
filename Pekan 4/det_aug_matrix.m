function determinant = det_aug_matrix(aug_matrix)
% fungsi determinan dari matriks diperbesar
% input:
% aug_matrix = matriks diperbesar
% output:
% determinant: nilai determinan matriks
[~, n] = size(aug_matrix); % definisikan jumlah kolom matriks sebagai variabel n untuk indeks
determinant = det(aug_matrix(:,1:n-1)); % hitung determinan dengan mengurangi 1 dari matriks diperbesar, yang merupakan matriks koefisien
end

% Problem 9.6(a)
% det_aug_matrix([0 2 5 9; 2 1 1 9; 3 1 0 10])
% determinant = 1

% Problem 9.7(b)
% det_aug_matrix([0.5 -1 -9.5; 1.02 -2 -18.8])
% determinant = 0.02