function result = cramer_rule(aug_matrix)
% fungsi pencarian solusi dengan aturan cramer/elimination of unknowns
% input:
% aug_matrix = matriks diperbesar
% output:
% result = hasil solusi
[~, n] = size(aug_matrix); % definisikan jumlah kolom matriks sebagai variabel n untuk indeks
result = []; % buat matriks hasil
for i = 1:n-1 % pengulangan sebanyak kolom matriks koefisien
    mod_aug_matrix = aug_matrix(:, 1:n-1); % definisikan matriks koefisien
    mod_aug_matrix(:, i) = aug_matrix(:, n); % ubah kolom matriks koefisien dengan matriks konstanta dari paling kiri sampai kanan
    result(i,1) = det(mod_aug_matrix)/det(aug_matrix(:, 1:n-1)); % hitung hasil determinan, masukkan pada matriks result
end

% Problem 9.6(b)
% cramer_rule([0 2 5 9; 2 1 1 9; 3 1 0 10])
% x1 = 6, x2 = -8, x3 = 5

% Problem 9.6(c)
% 2*x2+5*x3==9
% ans = 1 (terbukti)
% 2*x1+x2+x3==9
% ans = 1 (terbukti)
% 3*x1+x2==10
% ans = 1 (terbukti)

% Problem 9.7(d)
% Metode 'elimination of unknowns' juga menggunakan aturan cramer, sehingga
% cramer_rule([0.5 -1 -9.5; 1.02 -2 -18.8])
% x1 = 10, x2 = 14.5

% Problem 9.7(e)
% cramer_rule([0.52 -1 -9.5; 1.02 -2 -18.8])
% x1 = -10, x2 = 4.3
% dari perubahan koefisien x1 tersebut menggeser persamaan ke sebelah kiri
% bawah sehingga nilai solusi x1 dan x2 lebih kecil