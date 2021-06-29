% no 1
t = [1 2 3 4.5 6 7 8 8.5 10];
v = [5 5.5 6 7 7.5 7.5 7 6.5 5];

% (a)
tmax = max(t);
tmin = min(t);
f_tmax = 5;
f_tmin = 5;
hasil_v = (tmax-tmin)*(f_tmin+f_tmax)/2
% hasil_v = 45 m

% (b)
poly_coeff = poly_regression(t, v, 3)
% v = -0.0131 + 0.0991t + 0.3638t^2 + 4.4992t^3
hasil_integral = integral(@(t)  -0.0131 + 0.0991*t + 0.3638*t.^2 + 4.4992*t.^3, 1, 10)
% hasil integral = 1.1373e+04
