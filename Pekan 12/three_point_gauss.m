function hasil = three_point_gauss(func)
% fungsi double_two_point_gauss, untuk menghitung integral
% dengan metode two-point Gauss-Legendre
% input:
% func = fungsi yang ingin di integrasi
% xmin = batas bawah integral variabel x
% xmax = batas atas integral variabel x
% output:
% hasil = hasil integral
c0 = 5/9; c1 = 8/9; c2 = 5/9; % faktor bobot tiga titik Gauss-Legendre
x0 = -sqrt(3/5); x1 = 0; x2 = sqrt(3/5); % argumen fungsi tiga titik Gauss-Legendre
hasil = c0*func(x0)+c1*func(x1)+c2*func(x2);

% Problem 20.6 (b)
% >> T = 1;
% two point gauss
% untuk 0 <= t <= T/2
% >> hasil1 = two_point_gauss(@(t) (8*exp(-t/T)*sin(2*pi*t/T))^2, 0, T/2)
% hasil1 = 170.7915
% untuk T/2 <= t <= T
% >> hasil2 = 0
% >> Irms = sqrt((1/T)*(hasil1+hasil2))
% Irms = 13.0687