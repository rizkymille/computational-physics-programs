% Problem 19.2
func = @(x) 1-exp(-x);
xmin = 0;
xmax = 4;

% (a) analitis dengan fungsi integral
hasil_a = integral(func, xmin, xmax)
% hasil: hasil_a = 3.0183

% (b) dengan aplikasi tunggal aturan trapezoidal
f_xmin = func(xmin);
f_xmax = func(xmax);
hasil_b = (xmax-xmin)*(f_xmin+f_xmax)/2
err_b = abs((hasil_b-hasil_a)/hasil_a)*100
% hasil_b = 1.9634, err_b = 34.9515

% (c) aturan trapezoidal komposit dengan n = 2 dan n = 4
for n = 2:2:4
    x = xmin; h = (xmax - xmin)/n;
    s = func(xmin);
    for i = 1 : n-1
        x = x + h;
        s = s + 2*func(x);
    end
    s = s + func(xmax);
    hasil_c = (xmax - xmin) * s/(2*n)
    err_c = abs((hasil_c-hasil_a)/hasil_a)*100
    % n = 2
    % hasil: hasil_c = 2.7110, err_c = 10.1812
    % hasil: hasil_c = 2.9378, err_c = 2.6662
end

% (d) aplikasi tunggal aturan Simpson 1/3
n = 2;
h = (xmax-xmin)/n;
xh = xmin:h:xmax;
hasil_d = (xmax-xmin)*(func(xmin)+4*func(xh(2))+func(xmax))/6
err_d = abs((hasil_d-hasil_a)/hasil_a)*100
% hasil: hasil_d = 2.9602, err_d = 1.9245

% (e) aturan Simpson 1/3 komposit dengan n = 4
n = 4;
h = (xmax-xmin)/n;
xh = xmin:h:xmax;
sum_f_xi = sum(func(xh(1:2:n-1)));
sum_f_xj = sum(func(xh(2:2:n-2)));
hasil_e = (xmax-xmin)*(func(xmin)+4*sum_f_xi+2*sum_f_xj+func(xmax))/(3*n)
err_e = abs((hasil_e-hasil_a)/hasil_a)*100
% hasil: hasil_e = 1.9015, err_e = 37.0004

% (f) aturan Simpson 3/8
n = 4;
h = (xmax-xmin)/n;
xh = xmin:h:xmax;
hasil_f = (xmax-xmin)*(func(xmin)+3*(func(xh(2))+func(xh(3)))+func(xmax))/8
err_f = abs((hasil_f-hasil_a)/hasil_a)*100
% hasil_f = 2.7360, err_f = 9.3528

% (g) aturan Simpson komposit n = 5
n = 5;
h = (xmax-xmin)/n;
xh = xmin:h:xmax;
hasil_g_1 = (xh(3)-xmin)*(func(xmin)+4*func(xh(2))+func(xh(3)))/6;
hasil_g_2 = (xh(5)-(xh(3)))*(func(xh(3))+3*(func(xh(4))+func(xh(5)))+func(xmax))/8;
hasil_g = hasil_g_1 + hasil_g_2
err_g = abs((hasil_g-hasil_a)/hasil_a)*100
% hasil_g = 2.2773, err_g = 24.5513
