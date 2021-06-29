function [hasil, err, iter] = romberg_integrate(func, xmin, xmax, stop_err, max_iter)
% fungsi romberg_integrate, integral dengan metode romberg
% input:
% func = fungsi yang ingin di integrasi
% xmin = batas bawah integral
% xmax = batas atas integral
% stop_err = tingkat error penghentian
% max_iter = pengulangan maksimum
% output:
% hasil = hasil integral
% sekuens: sekuens hitungan pengulangan romberg integral
% err: nilai kesalahan
% iter: jumlah pengulangan

% jika argumen kurang dari 3, keluarkan error
if nargin<3, error('Argumen input kurang'),end
% jika argumen stop_err kosong, gunakan nilai 0 sebagai nilai error
% penghentian perhitungan
if nargin<4 || isempty(stop_err), stop_err = 0; end
% jika argumen max_iter kosong, gunakan nilai tak hingga sebagai batas
% pengulangan
if nargin<5 || isempty(max_iter), max_iter = Inf; end

% buat dari 1 segmen
n = 1;

% hitung luas trapezoidal 1 segmen
I(1,1) = trap(func,xmin,xmax,n);

iter = 0; % inisiasi variabel nilai pengulangan
while iter < max_iter % lakukan pengulangan ketika belum mencapai pengulangan maksimum
    iter = iter + 1; % naikkan nilai pengulangan setiap pengulangan
    n = 2^iter; % naikkan nilai segmen sebanyak 2 pangkat pengulangan
    I(iter + 1, 1) = trap(func,xmin,xmax,n); % hitung luas trapezoidalnya
    
    % kalkulasi nilai estimasi error O(h^2,3,4,dst) setiap pengulangan
    for k = 2:iter+1
        j = 2+iter-k;
        I(j,k) = (4^(k-1)*I(j+1,k-1)-I(j,k-1))/(4^(k-1)-1);
    end
    
    % kalkulasi nilai error
    err = abs((I(1, iter + 1)-I(2, iter))/I(1, iter + 1))*100;
    
    % hentikan pengulangan ketika error dibawah atau sama dengan nilai
    % error penghentian
    if err <= stop_err, break; end
end

% print nilai hasil perhitungan
hasil = I(1,iter+1);
end

function I = trap(func,a,b,n)
% fungsi trap, untuk menghitung secara aturan trapezoidal kuadratur

% jika argumen kurang dari 3, keluarkan error
if nargin < 3, error('Argumen input kurang'), end
% jika batas bawah lebih dari batas atas, keluarkan error
if a>b, error('Batas atas harus lebih besar daripada batas bawah'), end
% jika nilai segmen dikosongkan, gunakan 100
if nargin<4 || isempty(n), n = 100; end

% kalkulasi trapezoidal
x = a; h = (b - a)/n;
s = func(a);

% hitung trapezoidal dari seluruh segmen
for i = 1:n-1
    x = x + h;
    s = s + 2*func(x);
end

% hitung luas akhir trapezoidal
s = s + func(b);
I = (b - a) * s/(2*n);
end

% Problem 20.6 (a)
% >> T = 1;
% untuk 0 <= t <= T/2
% >> [hasil1, err, iter ] = romberg_integrate(@(t) (8*exp(-t/T)*sin(2*pi*t/T))^2, 0, T/2, 0.1)
% hasil1 = 9.8656
% untuk T/2 <= t <= T
% >> hasil2 = 0
% >> Irms = sqrt((1/T)*(hasil1+hasil2))
% Irms = 3.1410
