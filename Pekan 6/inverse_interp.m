function x_val = inverse_interp(x_points, y_points, y_val, order)
% fungsi interpolasi inverse, untuk mencari nilai x dari f(x) yang
% diketahui. butuh symbolic math toolbox
% input:
% x_points = data titik-titik koordinat x
% y_points = data titik-titik koordinat y atau f(x)
% y_val = nilai y atau f(x) yang ingin di cari x-nya
% order = orde dari polinom interpolasi
% output:
% x_val = nilai x hasil interpolasi inverse

if length(y_points) ~= length(x_points) % jika jumlah data x dan y tidak sama
    error('Jumlah data x dan y harus sama!') % keluarkan error
end

poly_coeff = polyfit(y_points, x_points, order); % fitting setiap titik dengan grafik polinomial untuk mencari koefisien polinom
syms x % inisiasi variabel simbolik yaitu x

if order == 2 % jika diminta interpolasi polinomial orde 2
    quad_eq = poly_coeff(1)*x.^2+poly_coeff(2)*x+poly_coeff(3); % masukkan koefisien pada persamaan polinomial orde 2 (kuadratik)
    x_val = double(solve(quad_eq == y_val, x)); % cari nilai x ketika persamaan sama dengan nilai y_val
elseif order == 3 % jika diminta interpolasi polinomial orde 3
    % menggunakan metode Bisection
    xlow = input('Masukkan batas x bawah: '); % minta input batas x atas
    xup = input('Masukkan batas x atas: '); % minta input batas x bawah
    stop_criterion = input('Masukkan batas error: '); % minta input nilai kriteria penghentian
    cubic_eq = poly_coeff(1)*x.^3+poly_coeff(2)*x.^2+poly_coeff(3)*x+poly_coeff(4); % masukkan koefisien pada persamaan polinomial orde 3 (kubik)
    x_val = bisection_interp(matlabFunction(cubic_eq), xlow, xup, stop_criterion, y_val); % cari nilai x ketika persamaan sama dengan nilai y_val dengan metode interpolasi bisection
else % jika orde tidak 2 atau 3
    error('Fungsi hanya berlaku untuk orde dua dan 3 saja'); % keluarkan pesan error
end

end

function x_bisect = bisection_interp(func, xlow, xup, stop_criterion, y_val)
% fungsi interpolasi bisection, untuk mencari nilai x dari suatu interval
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll). harus mempunyai
% variabel x
% xlow = interval minimum pencarian akar
% xup = interval maksimum pencarian akar
% stop_criterion = tingkat kecukupan error agar penghitungan dihentikan
% output:
% x_bisect = nilai x hasil bisection

% inisialisasi perhitungan awal
x_bisect = (xlow + xup)/2; % hitung nilai akar x dari antara kedua interval x
err_abs = 100; % inisialisasi error absolut

% perhitungan pengulangan
iter = 0; % inisiasi indeks pengulangan
while err_abs >= stop_criterion % jalankan pengulangan jika error sama dengan nol atau lebih dari sama dengan kecukupan error
    iter = iter + 1; % naikkan indeks pengulangan setiap loop
    xroot_old = x_bisect; % simpan nilai x lama
    x_bisect = (xlow + xup)/2; % hitung nilai x tengah dari interval
    
    if iter > 1 % jika indeks pengulangan lebih dari 1
        err_abs = abs((x_bisect-xroot_old)/x_bisect)*100; % hitung error absolut
    end
    
    if func(x_bisect) < y_val % jika nilai y dari x hasil bisection kurang dari nilai y dicari
        xup = x_bisect; % simpan nilai x menjadi interval maksimum
    elseif func(x_bisect) > y_val % jika nilai y dari x hasil bisection lebih dari nilai y dicari
        xlow = x_bisect; % simpan nilai x menjadi interval minimum
    else % jika perkalian hasil fungsi interval maksimum dan minimum sama dengan nol
        break % hentikan pengulangan
    end
end
fprintf('Kesalahan absolut: %f\n', err_abs) % tampakkan nilai error

end

% Problem 17.9(a)
% f(x) = 0.93
% f(x) = x^2/(1+x^2)
% 0.93(1+x^2)=x^2
% 0.93=x^2-0.93x^2
% 0.93 = 0.07x^2
% x^2 = 13.29
% x = 3.65 atau x = -3.65

% Problem 17.9(b)
% Interpolasi kuadratik
% inverse_interp([0 1 2 3 4 5], [0 0.5 0.8 0.9 0.941176 0.961538], 0.93, 2)
% Hasil:
% x = -0.1985
% atau
% x = 0.5757

% Problem 17.9(c)
% Interpolasi kubik
% inverse_interp([0 1 2 3 4 5], [0 0.5 0.8 0.9 0.941176 0.961538], 0.93, 3)
% Masukkan batas x bawah: 0
% Masukkan batas x atas: 5
% Masukkan batas error: 0.01
% Hasil:
% Kesalahan absolut: 0.006104
% x = 4.9997