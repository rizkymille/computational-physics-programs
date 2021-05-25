function xroot = no1(t)
% fungsi general roket nomor 1, dengan input u, m0, q, dan t
g = 9.81; % gravitasi
u = 1800; % kecepatan dilepaskannya
m0 = 160000; % massa t = 0
q = 2600; % laju konsumsi bahan bakar 
v = u.*log(m0./(m0-q.*t)) - g.*t; % fungsi

% plot waktu vs kecepatan
plot(t, v); % pasang plot
xlabel('waktu'); % label koordinat x
ylabel('kecepatan'); % label koordinat y
title('Kecepatan vs waktu roket'); % title plot

% untuk mencari akar, menggunakan metode bisection
tlow = 0; % menggunakan nilai terbawah t sebagai batas bawah pencarian
tup = 100; % menggunakan nilai teratas t sebagai batas atas pencarian
stop_criterion = 1e-7; % kriteria penghentian
v_meas = 750; % input v ingin dicari akarnya
xroot = bisection(@(t) u.*log(m0./(m0-q.*t)) - g.*t - v_meas, tlow, tup, stop_criterion); % lakukan pencarian akar dengan metode bisection
end

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
iter = 0;
while err_abs >= stop_criterion % jalankan pengulangan jika error sama dengan nol atau lebih dari sama dengan kecukupan error
    iter = iter + 1;
    xroot_old = xroot; % simpan nilai x lama
    xroot = (xlow + xup)/2; % hitung nilai x tengah dari interval
    
    if iter > 1
        err_abs = abs((xroot-xroot_old)/xroot)*100; % hitung error absolut
        fprintf('Kesalahan absolut: %f\n', err_abs) % tampakkan nilai error
    end
    
    if flow*func(xroot) < 0 % jika perkalian hasil fungsi interval maksimum dan minimum kurang dari nol
        xup = xroot; % simpan nilai x menjadi interval maksimum
    elseif func(xroot)*fup > 0 % jika perkalian hasil fungsi interval maksimum dan minimum lebih dari nol
        xlow = xroot; % simpan nilai x menjadi interval minimum
    else % jika perkalian hasil fungsi interval maksimum dan minimum sama dengan nol
        break % hentikan pengulangan
    end
end

end