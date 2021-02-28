function yroot = graphic(func, xmin, xmax)
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
xroot = input('Masukkan koordinat akar x dari grafik: '); % minta input nilai x untuk pencarian akar nilai y
yroot = func(xroot); % hitung akar nilai y

end

% No. 3 Problem 5.7 (a)
% graphic(@(x) -12-21*x+18*x.^2-2.75*x.^3, -100, 100)
% x = 0, y = -12