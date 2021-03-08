function result = secant(func, xr, xr_old, max_iteration, stop_criterion)
% fungsi secant, merupakan modifikasi dari newton raphson
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll)
% xr = nilai akar x tebakan pertama
% xr_old = nilai akar x tebakan pertama sebelumnya
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

iter = 0; % inisialisasi jumlah pengulangan
err_abs = abs((xr - xr_old)/xr) *100; % inisialisasi nilai error

while iter < max_iteration && xr_old ~= xr && err_abs > stop_criterion
    % ulang perhitungan ketika iterasi belum mencapai maksimum, dan nilai
    % akar x lama tidak sama dengan x baru (menyebabkan nilai NaN), dan
    % nilai error yang masih diatas kriteria penghentian
    iter = iter + 1; % naikkan jumlah iterasi setiap pengulangan
    new_xr = xr - func(xr)*(xr_old - xr)/(func(xr_old)-func(xr)); % kalkulasi akar x baru
    err_abs = abs((xr - xr_old)/xr) *100; % kalkulasi kesalahan absolut
    xr = new_xr; xr_old = xr; % simpan nilai baru menjadi nilai lama untuk diulang
end

result = [xr, err_abs, iter]; % ketika hitungan perulangan selesai, output hasil
end

% Problem 6.4 (c)
% secant(@(x) (7.*sin(x).*exp(-x)) - 1, 0.4, 0.5, 3, 0)
% x = 0.0028, kesalahan absolut = 25, iterasi = 1
% iterasi hanya sekali karena pada iterasi kedua nilai telah terkonvergen,
% sehingga jika tetap dikalkulasi maka hasilnya NaN