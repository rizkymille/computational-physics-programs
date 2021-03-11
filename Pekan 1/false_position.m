function xroot = false_position(func, xlow, xup, stop_criterion)
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
xroot = xup - (fup*(xlow - xup))/(flow - fup);
% hitung nilai akar x dari interval maksimum, dikurangi rasio antara kedua
% interval x dengan antara kedua interval hasil fungsi x yang dikalikan hasil fungsi maksimum  
err_abs = 100; % inisialisasi error absolut
iu = 0; il = 0; % inisialisasi indeks

% perhitungan pengulangan
while err_abs >= stop_criterion % jalankan pengulangan jika error sama dengan nol atau lebih dari sama dengan kecukupan error
    xroot_old = xroot; % simpan nilai x lama
    xroot = xup - (fup*(xlow - xup))/(flow - fup); %
    
    err_abs = abs((xroot-xroot_old)/xroot)*100; % hitung error absolut
    fprintf('Kesalahan absolut: %f\n', err_abs) % tampakkan nilai error
    
    if flow*fup < 0 % jika perkalian hasil fungsi interval maksimum dan minimum kurang dari nol
        xup = xroot; % simpan nilai x menjadi interval maksimum
        fup = func(xup); % simpan nilai fungsi dari xup terbaru menjadi interval fungsi maksimum
        il = il + 1; % naikkan indeks interval bawah
        if il >= 2 % jika indeks interval bawah lebih dari sama dengan 2
           flow = flow/2; % bagi 2 nilai fungsi dari interval minimum
        end
    elseif flow*fup > 0 % jika perkalian hasil fungsi interval maksimum dan minimum lebih dari nol
        xlow = xroot; % simpan nilai x menjadi interval minimum
        flow = func(xlow); % simpan nilai fungsi dari xlow terbaru menjadi interval fungsi minimum
        iu = iu + 1; % naikkan indeks interval atas
        if iu >= 2 % jika indeks interval atas lebih dari sama dengan 2
           fup = fup/2; % bagi 2 nilai fungsi dari interval maksimum
        end
    else
        break % hentikan pengulangan
    end
end

end

% No. 3 Problem 5.7 (c)
% false_position(@(x) -12-21*x+18*x.^2-2.75*x.^3, -1, 0, 1)
% x = -0.4150
