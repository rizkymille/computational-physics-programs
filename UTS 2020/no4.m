function y_val = no4(x_points, y_points, x_val, order)

if length(y_points) ~= length(x_points)
    error('Jumlah data x dan y harus sama!')
end

point_len = length(x_points);
div_diff = zeros(point_len, point_len);
div_diff(:,1) = y_points(:);

for j = 2:point_len 
    for i = 1:point_len-j+1
        div_diff(i,j) = (div_diff(i+1,j-1)-div_diff(i,j-1))/(x_points(i+j-1)-x_points(i));
    end
end

disp('Konstanta dan koefisien persamaan:');
disp(div_diff(1,:));

xt = 1;
y_val = div_diff(1,1);

for j = 1:order
    xt = xt.*(x_val-x_points(j));
    y_val = y_val+div_diff(1,j+1)*xt;
end

plot(x_val, y_val);
end

% orde 1 (linier)
% koefisien = -0.0068

% orde 2 (kuadrat)
% koefisien 1 = -0.0068
% koefisien 2 = 0

% orde 3 (kubik)
% koefisien 1 = -0.0068
% koefisien 2 = 0
% koefisien 3 = -0

% kerapatan = 1.0290 kg/m^3
