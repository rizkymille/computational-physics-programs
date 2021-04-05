function y_val = newton_interp(x_points, y_points, x_val)
% fungsi newton_interp, interpolasi metode newton dengan orde jumlah data -1
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
b = zeros(point_len,point_len); % buat matriks ukuran panjang data kali panjang data
b(:,1) = y_points(:); % masukkan variabel y pada kolom pertama b

for j = 2:point_len % ulang dari 2 sampai panjang data
    for i = 1:point_len-j+1 % ulang dari 1 sampai panjang data dikurang indeks j ditambah 1
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x_points(i+j-1)-x_points(i)); % kalkulasi variabel dan koefisien polinomial dari setiap orde
    end
end

xt = 1; % inisialisasi nilai xt
y_val = b(1,1); % nilai y adalah elemen baris pertama dan kolom pertama pada matriks b

for j = 1:point_len-1 % ulang untuk setiap orde
    xt = xt*(x_val-x_points(j)); % kalkulasi nilai x setiap orde
    y_val = y_val+b(1,j+1)*xt; % kalkulasi nilai y setiap orde
end

end

% Problem 17.4(a)
% Pemilihan sekuens titik: karena x = 3.4 berada diantara x = 3 dan x = 4, maka
% orde polinom pada interpolasi newton = jumlah titik - 1
% sekuens titik orde 1: x = [3 4], y = [6.5 2]
% sekuens titik orde 2: x = [3 4 5], y = [6.5 2 0]
% sekuens titik orde 3: x = [2.5 3 4 5], y = [7 6.5 2 0]
% Hasil:
% orde 1: 4.7
% orde 2: 4.4
% orde 3: 4.9504
