function roots = graphic(func, xmin, xmax)
% fungsi graphic, untuk mencari akar berdasarkan plot fungsi
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll)
% xmin = interval minimum penggambaran plot
% xmax = interval maksimum penggambaran plot
% output:
% yroot = akar nilai y dengan x sama dengan nol

% output pesan error ketika argumen input fungsi kurang atau lebih
if nargin < 3 % cek apakah jumlah argumen kurang dari 3
    error('Argumen kurang')
elseif nargin > 3 % cek apakah jumlah argumen lebih dari 3
    error('Argumen terlalu banyak')
end

x = linspace(xmin, xmax); % buat x sebagai rentang angka dari xmin sampai xmax
f = func(x); % buat f sebagai variabel hasil fungsi dari nilai-nilai x
plot(x, f), grid % gambarkan plot grafik dengan x sebagai sumbu x dan f sebagai sumbu y
root_num = input('Masukkan jumlah akar x yang ditemukan dari grafik: ');
roots = []; % prealokasi array kumpulan nilai akar akar
for i = 1:root_num % ulang permintaan input dengan iterasi dari jumlah akar
    xroot = input('Masukkan koordinat akar x dari grafik: '); % minta input nilai x untuk pencarian akar nilai y
    roots(i, 1) = xroot; % masukkan akar nilai x, masukkan dalam kolom 1
    roots(i, 2) = func(xroot); % hitung akar nilai y, masukkan dalam kolom 2
end
    
end

% Problem 6.4 (a)
% graphic(@(x) (7.*sin(x).*exp(-x))-1, 0, 2*pi)
% x = 0.1712, y = 0.0049
% x = 1.8932, y = -0.0002
