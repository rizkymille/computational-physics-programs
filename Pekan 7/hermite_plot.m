function yh = hermite_plot(x,y)
% fungsi hermite_plot, berfungsi untuk interpolasi hermite cubic untuk
% dibuat plotnya
% input:
% x = data koordinat x/variabel independen
% y = data koordinat y/variabel dependen
% output:
% ys = data koordinat y hasil interpolasi

xx = linspace(min(x), max(x)); % definisikan koordinat x grafik
yh = interp1(x, y, xx, 'cubic'); % interpolasikan dengan metode piecewise Hermite kubik
figure() % buat latar figure untuk plot
plot(x,y,'o',xx,yh,'-',xx,yhumps); % buat plot data sebagai titik dan hasil interpolasi sebagai garis
title('Plot Hermite Kubik') % buat judul plot
xlabel('x') % buat label koordinat x
ylabel('f(x)') % buat label koordinat y
end

% Problem 18.1(c)
% x = [1 2 3 4 5];
% y = [1 5 8 2 1];
% hermite_plot(x,y)
% hasil: plot grafik interpolasi hermite