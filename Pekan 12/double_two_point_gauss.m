function hasil = double_two_point_gauss(func, xmin, xmax, ymin, ymax)
% fungsi double_two_point_gauss, untuk menghitung integral dua variabel
% dengan metode two-point Gauss-Legendre
% input:
% func = fungsi yang ingin di integrasi
% xmin = batas bawah integral variabel x
% xmax = batas atas integral variabel x
% ymin = batas bawah integral variabel y
% ymax = batas atas integral variabel y
% output:
% hasil = hasil integral

% mengganti batas integral variabel x dan y dengan formula two-point
% Gauss-Legendre
x_g = @(x_d) ((xmax+xmin)+(xmax-xmin).*x_d)/2; 
dx = (xmax-xmin)/2;
y_g = @(y_d) ((ymax+ymin)+(ymax-ymin).*y_d)/2;
dy = (ymax-ymin)/2;
% hitung integral
hasil = integral2(@(x_d, y_d) func(x_g(x_d), y_g(y_d)).*dy.*dx, -1, 1, -1, 1);

% Problem 20.9 (a)
% >> double_two_point_gauss(@(x,y) (x.^2-3*y.^2+x*y.^3), 0, 4, -2, 2)
% hasil = 21.3333
% Problem 20.9 (b)
% >> integral2(@(x,y) (x.^2-3.*y.^2+x.*y.^3), 0, 4, -2, 2)
% hasil = 21.3333