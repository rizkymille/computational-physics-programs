% Problem 19.6
syms x y
func = @(x,y) x.^2-3.*y.^2+x.*y.^3;
xmin = 0; xmax = 4;
ymin = -2; ymax = 2;

% (a) analitik & (d) integral2
hasil_a = integral2(func, xmin, xmax, ymin, ymax)
% hasil_a = 21.3333

% (b) aturan trapezoidal komposit dengan n = 2
n = 2;
x_b = xmin; y_b = ymin; h_x = (xmax - xmin)/n; h_y = (ymax - ymin)/n;
s = func(xmin, ymin);
for i = 1:n-1
    x_b = x_b + h_x;
    y_b = y_b + h_y;
    s = s + 2*func(x_b, y_b);
end
s = s + func(xmax, ymax);
hasil_b = (xmax - xmin)*(ymax - ymin)*s/((2.*n).^2)
err_b = abs((hasil_b-hasil_a)/hasil_a)*100
% hasil_b = 32, err_b = 50.0000

% (c) aplikasi tunggal aturan Simpson 1/3
n = 2;
h_x = (xmax-xmin)/n;
xh = xmin:h_x:xmax;
hasil_c_x = (xmax-xmin)*(func(xmin, y)+4*func(xh(2), y)+func(xmax, y))/6;
h_y = (ymax-ymin)/n;
yh = ymin:h_y:ymax;
hasil_c = vpa((ymax-ymin)*(subs(hasil_c_x, y, ymin)+4*subs(hasil_c_x, y, yh(2))+subs(hasil_c_x, y, ymax))/6)
err_c = abs((hasil_c-hasil_a)/hasil_a)*100
% hasil_c = 21.3333333, err_c = 0.00000000013