function hasil = two_point_gauss(func, xmin, xmax)
% fungsi double_two_point_gauss, untuk menghitung integral
% dengan metode two-point Gauss-Legendre
% input:
% func = fungsi yang ingin di integrasi
% xmin = batas bawah integral variabel x
% xmax = batas atas integral variabel x
% output:
% hasil = hasil integral

% mengganti batas integral variabel x dengan formula two-point
% Gauss-Legendre
x_g = @(x_d) ((xmax+xmin)+(xmax-xmin).*x_d)./2; 
dx = (xmax-xmin)./2;
% ganti variabel x menjadi x_d dengan diatas
% hitung integral x
hasil = integral(@(x_d) func(x_g(x_d)).*dx, -1, 1);

% Problem 20.6 (b)
% >> T = 1;
% two point gauss
% untuk 0 <= t <= T/2
% >> hasil1 = two_point_gauss(@(t) (8.*exp(-t/T).*sin(2.*pi.*t/T)).^2, 0, T/2)
% hasil1 = 9.8641
% untuk T/2 <= t <= T
% >> hasil2 = 0
% >> Irms = sqrt((1/T)*(hasil1+hasil2))
% Irms = 3.1407

% Problem 20.6 (c)
% >> T = 1;
% untuk 0 <= t <= T/2
% >> hasil1 = integral(@(t) (8.*exp(-t/T).*sin(2.*pi.*t/T)).^2, 0, T/2)
% hasil1 = 9.8641
% untuk T/2 <= t <= T
% >> hasil2 = 0
% >> Irms = sqrt((1/T)*(hasil1+hasil2))
% Irms = 3.1407