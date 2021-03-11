function result = secant_mod(func, xr, perturb_frac, max_iteration, stop_criterion)
% fungsi secant dimodifikasi, yang dimodifikasi dari fungsi secant biasa
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll)
% xr = nilai akar x tebakan pertama
% perturb_frac = konstanta pecahan pembagian
% max_iteration = pengulangan maksimum. Jika ingin terus menerus, tulis
% 'Inf'
% stop_criterion = tingkat kecukupan error agar penghitungan dihentikan.
% Jika ingin terus menerus, isi '0'
% output:
% result = [xr, err_abs, iter] berupa array dari akar x, kesalahan absolut,
% dan jumlah iterasi

if nargin < 5 % cek apakah jumlah argumen kurang dari 3
    error('Argumen kurang')
elseif nargin > 5 % cek apakah jumlah argumen lebih dari 3
    error('Argumen terlalu banyak')
end

pf = perturb_frac; % penyingkatan nama variabel, untuk memudahkan penulisan
iter = 0; % inisialisasi jumlah pengulangan
err_abs = 100; % inisialisasi nilai error

while iter < max_iteration && err_abs > stop_criterion
    iter = iter + 1; % naikkan jumlah iterasi setiap pengulangan
    new_xr = xr - pf*xr*func(xr)/(func(xr + pf*xr)-func(xr)); % naikkan jumlah iterasi setiap pengulangan
    err_abs = abs((new_xr - xr)/new_xr) *100; % kalkulasi kesalahan absolut
    xr = new_xr; % simpan nilai baru menjadi nilai lama untuk diulang
end

result = [xr, err_abs, iter]; % ketika hitungan perulangan selesai, output hasil
end

% Problem 6.4 (d)
% secant_mod(@(x) (7.*sin(x).*exp(-x)) - 1, 0.3, 0.01, 5, 0)
% x = 0.1702, kesalahan absolut = 0, iterasi = 5

% Problem 6.5 (b)
% secant_mod(@(x) x.^5-16.05.*x.^4 + 88.75.*x.^3 - 192.0375.*x.^2 + 116.35.*x + 31.6875, 0.5825, 0.05, Inf, 0.01)
% x = -0.2, kesalahan absolut = 0.0005, iterasi 12
