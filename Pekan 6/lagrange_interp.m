function y_val = lagrange_interp(x_points, y_points, x_val)
% fungsi lagrange_inter, interpolasi metode lagrange dengan orde jumlah data -1
% input:
% x_points = data titik-titik koordinat x
% y_points = data titik-titik koordinat y atau f(x)
% y_val = nilai y atau f(x) yang ingin di cari x-nya
% output:
% y_val = nilai y hasil interpolasi

if length(y_points) ~= length(x_points) % jika jumlah data x dan y tidak sama
    error('Jumlah data x dan y harus sama!') % keluarkan error
end

point_len = length(x_points); % simpan panjang data sebagai variabel n
s = 0; % inisiasi variabel hasil penjumlahan
for i = 1:point_len % ulang dari 1 sampai panjang data
    for j = 1:point_len % ulang dari 1 sampai panjang data
        if i ~= j % indeks variabel i dan j harus berbeda untuk dikalkulasi
            y_points(i) = y_points(i)*(x_val-x_points(j))/(x_points(i)-x_points(j)); % kalkulasi variabel dan koefisien polinomial dari setiap orde
        end
    end
    s = s+y_points(i); % jumlahkan seluruh variabel polinomial dari sebelumnya secara rekursi
end

y_val = s; % hasil akhirnya merupakan nilai y hasil interpolasi
end

% Problem 17.4(a)
% Pemilihan sekuens titik: karena x = 3.4 berada diantara x = 3 dan x = 4, maka
% orde polinom pada interpolasi lagrange = jumlah titik - 1
% sekuens titik orde 1: x = [3 4], y = [6.5 2]
% sekuens titik orde 2: x = [3 4 5], y = [6.5 2 0]
% sekuens titik orde 3: x = [2.5 3 4 5], y = [7 6.5 2 0]
% Hasil:
% orde 1: 4.7
% orde 2: 4.4
% orde 3: 4.9504