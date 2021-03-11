function xroot = bisection(func, xlow, xup, stop_criterion)
% fungsi bisection, untuk mencari akar dari suatu interval
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll). harus mempunyai
% variabel x
% xlow = interval minimum pencarian akar
% xup = interval maksimum pencarian akar
% stop_criterion = tingkat kecukupan error agar penghitungan dihentikan
% output:
% xroot = nilai akar

% output pesan error ketika argumen input fungsi kurang atau lebih
if nargin < 4 % cek apakah jumlah argumen kurang dari 4
    error('Argumen kurang')
elseif nargin > 4 % cek apakah jumlah argumen lebih dari 4
    error('Argumen terlalu banyak')
end

% inisialisasi perhitungan awal
flow = func(xlow); fup = func(xup); % hitung hasil fungsi nilai interval minimum dan maksimum
xroot = (xlow + xup)/2; % hitung nilai akar x dari antara kedua interval x
err_abs = 100; % inisialisasi error absolut

% perhitungan pengulangan
while err_abs >= stop_criterion % jalankan pengulangan jika error sama dengan nol atau lebih dari sama dengan kecukupan error
    xroot_old = xroot; % simpan nilai x lama
    xroot = (xlow + xup)/2; % hitung nilai x tengah dari interval
    
    err_abs = abs((xroot-xroot_old)/xroot)*100; % hitung error absolut
    fprintf('Kesalahan absolut: %f\n', err_abs) % tampakkan nilai error
    
    if flow*fup < 0 % jika perkalian hasil fungsi interval maksimum dan minimum kurang dari nol
        xup = xroot; % simpan nilai x menjadi interval maksimum
    elseif flow*fup > 0 % jika perkalian hasil fungsi interval maksimum dan minimum lebih dari nol
        xlow = xroot; % simpan nilai x menjadi interval minimum
    else % jika perkalian hasil fungsi interval maksimum dan minimum sama dengan nol
        break % hentikan pengulangan
    end
end

end

% No. 2 Problem 5.1
% m = 95; g = 9.81; v = 46; t = 9;
% bisection(@(cd) sqrt(g.*m./cd).*tanh(sqrt(g.*cd./m).*t) - v, 0.2, 0.5, 5)
% x = 0.2094

% No. 3 Problem 5.7 (b)
% bisection(@(x) -12-21*x+18*x.^2-2.75*x.^3, -1, 0, 1)
% x = -0.9922
