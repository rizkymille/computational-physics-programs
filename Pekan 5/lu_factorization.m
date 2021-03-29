function x = lu_factorization(aug_matrix) % buat fungsi lu_factorization
[row_am, col_am] = size(aug_matrix); % definisikan ukuran matriks

if row_am ~= col_am-1 % jika matriks koefisien tidak persegi
    error('Matriks koefisien harus persegi!') % keluarkan error
end

[L, U] = lu(aug_matrix(:,1:col_am-1)); % faktorisasi LU matriks koefisien
d = L\aug_matrix(:,col_am); % substitusi matriks
x = U\d; % substitusi matriks
end


% Problem 10.10
% 3*x1-2*x2+x3=-10
% 2*x1+6*x2-4*x3=44
% -8*x1-2*x2+5*x3=-26
% lu_factorization([3 -2 1 -10; 2 6 -4 44; -8 -2 5 -26])
% x1 = 1.2121, x2 = 6.4848, x3 = -0.6667