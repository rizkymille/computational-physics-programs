function ys = spline_plot(x,y)
% fungsi spline_plot, berfungsi untuk interpolasi spline kubik untuk dibuat
% plotnya
% input:
% x = data koordinat x/variabel independen
% y = data koordinat y/variabel dependen
% output:
% ys = data koordinat y hasil interpolasi

xx = linspace(min(x), max(x)); % definisikan koordinat x grafik
ys = spline(x, y, xx); % interpolasikan dengan metode spline kubik
figure() % buat latar figure untuk plot
plot(x,y,'o',xx,ys,'-'); % buat plot data sebagai titik dan hasil interpolasi sebagai garis
title('Plot Spline Kubik') % buat judul plot
xlabel('x') % buat label koordinat x
ylabel('f(x)') % buat label koordinat y
end

% Problem 18.1(b)
% x = [1 2 2.5 3 4 5];
% y = [1 5 7 8 2 1];
% spline_plot(x,y)
% hasil: plot grafik interpolasi spline