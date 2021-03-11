% Jika menggunakan Symbolic Math Toolbox, hilangkan komentar dengan tanda
% '%//'

%// function result = newton_raphson(func, xr, max_iteration, stop_criterion)
function result = newton_raphson(func, dfunc, xr, max_iteration, stop_criterion)
% fungsi newton raphson, untuk mencari akar berdasarkan 1 titik awal
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll)
% dfunc = derivatif dari fungsi yang ingin dicari. Dicari secara manual.
% Jika ingin matlab mencarinya secara otomatis, gunakan Symbolic Math
% Toolbox (sysms)
% xr = nilai akar x tebakan pertama
% max_iteration = pengulangan maksimum. Jika ingin terus menerus, tulis
% 'Inf'
% stop_criterion = tingkat kecukupan error agar penghitungan dihentikan.
% Jika ingin terus menerus, isi '0'
% output:
% result = [xr, err_abs, iter] berupa array dari akar x, kesalahan absolut,
% dan jumlah iterasi

%// if nargin < 4
if nargin < 5 % cek apakah jumlah argumen kurang dari 3
    error('Argumen kurang')
%// elseif nargin > 4
elseif nargin > 5 % cek apakah jumlah argumen lebih dari 3
    error('Argumen terlalu banyak')
end

iter = 0; % inisialisasi jumlah pengulangan
err_abs = 100; % inisialisasi nilai error
%// dfunc = diff(func, x);

while iter < max_iteration && err_abs > stop_criterion
    % ulang perhitungan ketika iterasi belum mencapai maksimum, dan error
    % masih sama dengan nol atau masih diatas kriteria penghentian
    iter = iter + 1; % naikkan jumlah iterasi setiap pengulangan
    xr_old = xr; % simpan nilai akar x lama
    xr = xr - func(xr)/dfunc(xr); % kalkulasi akar x baru
    err_abs = abs((xr - xr_old)/xr) *100; % kalkulasi kesalahan absolut
end

result = [xr, err_abs, iter]; % ketika hitungan perulangan selesai, output hasil
end

% Problem 6.4 (b)
% (versi syms) newton_raphson(@(x) (7.*sin(x).*exp(-x)) - 1, 0.3, 3, 0)
% newton_raphson(@(x) (7.*sin(x).*exp(-x)) - 1, @(x) 7.*(exp(-x)*cos(x) - exp(-x)*sin(x)), 0.3, 3, 0)
% x = 0.1702, error absolut = 0.4529, iterasi = 3

% Problem 6.5 (a)
% (versi syms) newton_raphson(@(x) x.^5-16.05.*x.^4 + 88.75.*x.^3 - 192.0375.*x.^2 + 116.35.*x + 31.6875, 0.5825, Inf, 0.01)
% newton_raphson(@(x) x.^5-16.05.*x.^4 + 88.75.*x.^3 - 192.0375.*x.^2 + 116.35.*x + 31.6875, @(x) 5.*x.^4 - 64.2.*x.^3 + 266.25.*x.^2 - 384.075*x + 116.35, 0.5825, Inf, 0.01)
% x = 6.5000, kesalahan absolut = 0.0558, iterasi = 21
