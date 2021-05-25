function y_val = no3(x_points, y_points, x_val)
y_val = newton_interp(x_points, y_points, x_val);
x_graph = linspace(min(x_points),max(x_points));
y_graph = newton_interp(x_points, y_points, x_graph);
plot(x_graph, y_graph);
end

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
div_diff = zeros(point_len, point_len); % buat matriks 'divided difference' sebesar panjang data kali panjang data
div_diff(:,1) = y_points(:); % masukkan variabel y pada kolom pertama b

% perhitungan koefisien
for j = 2:point_len % ulang dari 2 sampai panjang data
    for i = 1:point_len-j+1 % ulang dari 1 sampai panjang data dikurang indeks j ditambah 1
        div_diff(i,j) = (div_diff(i+1,j-1)-div_diff(i,j-1))/(x_points(i+j-1)-x_points(i)); % kalkulasi variabel dan koefisien polinomial dari setiap orde
    end
end

% perhitungan variabel
xt = 1; % inisialisasi perhitungan variabel (x-xi)
y_val = div_diff(1,1); % nilai y adalah elemen baris pertama dan kolom pertama pada matriks 'divided difference'

% gabungkan koefisien dengan variabel
for j = 1:point_len-1 % ulang untuk setiap orde (jumlah data - 1)
    xt = xt.*(x_val-x_points(j)); % kalkulasi nilai x setiap orde
    y_val = y_val+div_diff(1,j+1)*xt; % kalkulasi nilai y setiap orde
end

end