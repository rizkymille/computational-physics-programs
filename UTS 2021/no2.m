function x = no2(aug_matrix) % buat fungsi lu_factorization
[row_am, col_am] = size(aug_matrix); % definisikan ukuran matriks

if row_am ~= col_am-1 % jika matriks koefisien tidak persegi
    error('Matriks koefisien harus persegi!') % keluarkan error
end

[L, U] = lu(aug_matrix(:,1:col_am-1)); % faktorisasi LU matriks koefisien
d = L\aug_matrix(:,col_am); % substitusi matriks
x = U\d; % substitusi matriks
end