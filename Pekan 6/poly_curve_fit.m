function y_val = poly_curve_fit(x_points, y_points, x_val)
% fungsi poly_curve_fit, interpolasi fitting kurva polinomial dengan orde jumlah data -1
% input:
% x_points = data titik-titik koordinat x
% y_points = data titik-titik koordinat y atau f(x)
% y_val = nilai y atau f(x) yang ingin di cari x-nya
% output:
% y_val = nilai y hasil interpolasi

if length(y_points) ~= length(x_points) % jika jumlah data x dan y tidak sama
    error('Jumlah data x dan y harus sama!') % keluarkan error
end

poly_coeff = polyfit(x_points, y_points, length(x_points)-1); % fitting setiap titik dengan grafik polinomial untuk mencari koefisien polinom
x_graph = linspace(min(x_points),max(x_points)); % definisikan koordinat x grafik dari nilai rentang titik x terkecil sampai terbesar
y_graph = polyval(poly_coeff,x_graph); % kalkulasi hasil polinomial y untuk grafik dengan koefisien yang telah ditemukan dengan nilai x grafik
y_val = polyval(poly_coeff, x_val); % kalkulasi hasil polinomial y untuk interpolasi dengan koefisien yang telah ditemukan dengan nilai x yang dicari
plot(x_points, y_points, 'o', x_graph, y_graph) % buat grafik kurva dan titik titiknya
end

% Problem 17.1
% x = [0 1.8 5 6 8.2 9.2 12]
% y = [26 16.415 5.375 3.5 2.015 2.54 8]
% Nilai x yang dicari y-nya: x = 3.5
% poly_curve_fit([0 1.8 5 6 8.2 9.2 12],[26 16.415 5.375 3.5 2.015 2.54 8], 3.5)
% Hasil: 
% x = 3.5, y = 9.5937