function [err_spline_mean, err_hermite_mean] = compare_spline_hermite(x,y)
% fungsi compare_spline_hermite, berfungsi untuk interpolasi spline dan
% hermite yang akan dibandingkan performanya dan plotnya
% input:
% x = data koordinat x/variabel independen
% y = data koordinat y/variabel dependen
% output:
% err_spline_mean = error dari interpolasi spline
% err_hermite_mean = error dari interpolasi hermite

% karena fungsi ini bertugas untuk menghasilkan plot, maka definisikan
% variabel x interpolasi sebagai rentang data dari x minimum sampai x
% maksimum
xx = linspace(min(x), max(x));

% Fungsi humps
yhumps = 1./((xx-0.3).^2+0.01)+ 1./((xx-0.9).^2+0.04) - 6;

% spline kubik dengan kondisi not-a-knot
ys = spline(x, y, xx); % interpolasikan dengan metode spline kubik
figure() % buat latar figure untuk plot
plot(x,y,'o',xx,ys,'-',xx,yhumps); % buat plot data sebagai titik dan hasil interpolasi sebagai garis
title('Plot Spline Kubik vs Fungsi Humps') % buat judul plot
xlabel('x') % buat label koordinat x
ylabel('f(x)') % buat label koordinat y

% interpolasi Hermite kubik
yh = interp1(x, y, xx, 'cubic'); % interpolasikan dengan metode piecewise Hermite kubik
figure() % buat latar figure untuk plot
plot(x,y,'o',xx,yh,'-',xx,yhumps); % buat plot data sebagai titik dan hasil interpolasi sebagai garis
title('Plot Hermite Kubik vs Fungsi Humps') % buat judul plot
xlabel('x') % buat label koordinat x
ylabel('f(x)') % buat label koordinat y

% komparasi performa interpolasi berdasarkan error
err_spline = abs((ys-yhumps)/yhumps)*100; % error antara hasil spline dengan fungsi humps
err_spline_mean = mean(err_spline); % ambil rata-rata errornya
err_hermite = abs((ys-yhumps)/yhumps)*100; % error antara hasil Hermite dengan fungsi humps
err_hermite_mean = mean(err_hermite); % ambil rata-rata errornya

if err_hermite_mean > err_spline_mean % jika error interpolasi Hermite lebih besar daripada interpolasi spline
    disp('Interpolasi hermite mempunyai performa lebih baik daripada interpolasi spline'); % print ini
elseif err_spline_mean > err_hermite_mean % jika error interpolasi spline lebih besar daripada interpolasi Hermite
    disp('Interpolasi spline mempunyai performa lebih baik daripada interpolasi spline'); % print ini
else % jika error interpolasi Hermite sama dengan interpolasi spline
    disp('Kedua interpolasi mempunyai performa yang sama baik'); % print ini
end

end

% Problem 18.3
% x = 0:0.1:1;
% y = [5.176 15.471 45.887 96.500 47.448 19.000 11.692 12.382 17.846 21.703 16.000];
% (a)
% hasil: Error rata-rata spline: 0.9395 dan plot grafik Spline vs Hump
% (b)
% hasil: Error rata-rata hermite: 0.9395 dan plot grafik Spline vs Hump