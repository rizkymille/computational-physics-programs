% Problem 15.4
function [poly_coeff, r2, std_error] = poly_regression(x_points,y_points,m)
% fungsi poly_regression, untuk regresi dengan polinomial
% input:
% x_points = data variabel independen
% y_points = data variabel dependen
% m = orde polinomial untuk dikalkulasi
% output:
% poly_coeff = koefisien polinomial
% r2 = koefisien determinasi/korelasi
% std_error = standar error

n = length(x_points);

if length(y_points)~=n, error('Jumlah data x dan y haruslah sama'); end % kasus data asimetris
if m >= n, error('Orde harus kurang dari jumlah data'); end % kasus orde lebih dari sama dengan jumlah data

poly_coeff = polyfit(x_points, y_points, m); % fitting setiap titik dengan polinomial untuk mencari koefisien
x_graph = linspace(min(x_points),max(x_points)); % definisikan rentang koordinat x grafik 
y_graph = polyval(poly_coeff,x_graph); % kalkulasi polinomial y untuk grafik dengan koefisien nilai x grafik
sum_of_squares = sum((y_points - polyval(poly_coeff,x_points)).^2); % kalkulasi jumlah kuadrat
std_error = sqrt(sum_of_squares/(n-(m+1))); % kalkulasi standard error
diff_y_squared = sum((y_points-mean(y_points)).^2); % kalkulasi selisih y dengan rata-rata y kuadrat
r2 = 1-(sum_of_squares/diff_y_squared); % kalkulasi r kuadrat
plot(x_points, y_points, 'o', x_graph, y_graph) % plot grafik
end

% Problem 15.3
% Input:
% [poly_coeff, r2, std_error] = poly_regression([3 4 5 7 8 9 11 12], [1.6 3.6 4.4 3.4 2.2 2.8 3.8 4.6], 2)
% Output:
% koefisien polinomial/poly_coeff=
% a0 = 0.0159, a1 = -0.1005, a2 = 3.0323
% r2 = 0.1976
% standar error/std_error = 1.1044
