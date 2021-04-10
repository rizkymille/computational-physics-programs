function yns = natspline_plot(x,y)
% fungsi natspline_plot, berfungsi untuk interpolasi natural end spline
% untuk dibuat plotnya
% input:
% x = data koordinat x/variabel independen
% y = data koordinat y/variabel dependen
% output:
% yns = data koordinat y hasil interpolasi

xx = linspace(min(x), max(x)); % definisikan koordinat x grafik
yns = natspline(x, y, xx); % interpolasikan dengan metode spline kubik
figure() % buat latar figure untuk plot
plot(x,y,'o',xx,yns,'-'); % buat plot data sebagai titik dan hasil interpolasi sebagai garis
title('Plot Spline Kubik') % buat judul plot
xlabel('x') % buat label koordinat x
ylabel('f(x)') % buat label koordinat y
end


function yns = natspline(x,y,xx)
% fungsi natspline, berfungsi untuk interpolasi dengan natural end spline,
% bukan dengan kondisi not-a-knot end
% input:
% x = data koordinat x/variabel independen
% y = data koordinat y/variabel dependen
% xx = koordinat x yang ingin di interpolasi
% output:
% yns = data koordinat y hasil interpolasi

n = length(x); % definisikan panjang data x sebagai variabel n

if length(y) ~= n % jika panjang data x dan y tidak sama
    error('x dan y harus mempunyai panjang yang sama'); % keluarkan error
end

if any(diff(x) <= 0) % jika ada data x yang kelanjutannya menurun
    error('x tidak benar-benar naik'); % keluarkan error
end

m = length(xx); % definisikan panjang data x interpolasi sebagai variabel m
b = zeros(n,n); % definisikan b sebagai matriks berisi 0 dengan ukuran nxn
aa(1,1) = 1; aa(n,n) = 1; % set nilai diagonal ujung matriks koefisien h sebagai 1
bb(1) = 0; bb(n) = 0; % set nilai ujung matriks konstanta bb sebagai 0

for i = 2:n-1 % ulang dari 2 sampai panjang data x dikurang 1
    % perhitungan turunan dari spline kubik dengan matriks aa dari h
    aa(i,i-1) = h(x, i-1);
    aa(i,i) = 2 * (h(x, i-1) + h(x, i));
    aa(i,i+1) = h(x, i);
    
    bb(i) = 3 * (fd(i + 1, i, x, y) - fd(i, i - 1, x, y)); % set matriks bb sebagai fd
end

c = aa\bb'; % cari nilai koefisien c dengan membagi aa dengan bb

for i = 1:n - 1 % mencari penyelesaian koefisien a, b dan d
    % perhitungan turunan dari spline kubik
    a(i) = y(i);
    b(i) = fd(i + 1, i, x, y) - h(x, i) / 3 * (2 * c(i) + c(i + 1));
    d(i) = (c(i + 1) - c(i)) / 3 / h(x, i);
end

for i = 1:m % melakukan interpolasi pada nilai x diinginkan
    [yns(i),dy(i),d2(i)] = SplineInterp(x, n, a, b, c, d, xx(i)); % lakukan interpolasi spline kedua
end

end

function hh = h(x, i)
% fungsi h, untuk mencari jarak nilai data x
% input:
% x = data variabel independen
% i = indeks pertama
% output:
% hh = jarak data koordinat x
hh = x(i + 1) - x(i); % nilai hh adalah jarak antara data x
end

function fdd = fd(i, j, x, y) 
% fungsi fd, untuk mencari gradien
% input:
% x = data variabel independen
% y = data variabel dependen
% i = indeks pertama
% j = indeks kedua
fdd = (y(i) - y(j)) / (x(i) - x(j)); % hitung gradien dengan delta y dibagi delta x
end

function [yyy,dyy,d2y] = SplineInterp(x, n, a, b, c, d, xi)
% fungsi SplineInterp, untuk interpolasi spline pada turunan kedua yang
% menghasilkan turunan ketiga
% input:
% n, a, b, c, d = koefisien
% xi, x = data
% output:
% yyy = nilai y interpolasi kedua
% dyy = turunan y pertama interpolasi pertama
% d2y = turunan y kedua interpolasi pertama

for ii = 1:n - 1 % untuk indeks dari 1 sampai n-1
    if xi >= x(ii) - 0.000001 && xi <= x(ii + 1) + 0.000001
        yyy = a(ii) + b(ii)*(xi - x(ii))+c(ii)*(xi - x(ii))^2 + d(ii)*(xi - x(ii))^3; % cari nilai yy
        dyy = b(ii)+2*c(ii)*(xi - x(ii))+3*d(ii)*(xi - x(ii))^2; % cari turunan yy
        d2y = 2*c(ii)+6*d(ii)*(xi - x(ii)); % cari turunan kedua yy
        break
    end
end

end

% Problem 18.1(a)
% x = [1 2 2.5 3 4 5];
% y = [1 5 7 8 2 1];
% natspline_plot(x,y)
% hasil: plot grafik