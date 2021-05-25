function [true_val, centered_diff, derive_est] = richardson_extrapolate(func, x_val, h1, h2)

% hitung nilai turunan acuan
% menggunakan symbolic math toolbox pada matlab, jika tidak
% punya/menggunakan octave, gunakan kode bertanda %* dan hilangkan kode
% dibawah
syms x 
f(x) = sym(func);
df = diff(f,x);

%* df = input("Masukkan turunan pertama fungsi: ");

true_val = double(df(x_val)); % hitung nilai turunan asli acuan

% step size 1
% hitung O(h^2) dan O(h^4)
centered_oh2_1 = (func(x_val+h1) - func(x_val-h1))/(2.*h1);
% kumpulkan pada matriks forward_diff
centered_diff(1,1) = centered_oh2_1;
% hitung persentase error
centered_oh2_1_err = abs((centered_oh2_1 - true_val)/true_val)*100;
% kumpulkan pada matriks forward_diff
centered_diff(1,2) = centered_oh2_1_err;

% step size 2
% hitung O(h^2) dan O(h^4)
centered_oh2_2 = (func(x_val+h2) - func(x_val-h2))/(2.*h2);
% kumpulkan pada matriks forward_diff
centered_diff(2,1) = centered_oh2_2;
% hitung persentase error
centered_oh2_2_err = abs((centered_oh2_2 - true_val)/true_val)*100;
% kumpulkan pada matriks forward_diff
centered_diff(2,2) = centered_oh2_2_err;

% derivative estimate
derive_est = (4/3)*centered_oh2_1 - (1/3)*centered_oh2_2;

% Problem 21.4
% true value: f'(pi/4) = -0.7071
% centered difference:
% step size 1 (h1):
% O(h^2) = -0.5848, ei = 17.3007%
% step size 2 (h2):
% O(h^2) = -0.6752, ei = 4.5070%

% estimasi derivatif:
% D: -0.5546