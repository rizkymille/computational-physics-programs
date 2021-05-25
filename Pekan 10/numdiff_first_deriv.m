function [true_val, forward_diff, centered_diff, backward_diff] = numdiff_first_deriv(func, x_val, h)

% hitung nilai turunan acuan
% menggunakan symbolic math toolbox pada matlab, jika tidak
% punya/menggunakan octave, gunakan kode bertanda %* dan hilangkan kode
% dibawah
syms x 
f(x) = sym(func);
df = diff(f,x);

%* df = input("Masukkan turunan pertama fungsi: ");

true_val = double(df(x_val)); % hitung nilai turunan asli acuan

% kalkulasi forward difference
% hitung O(h) dan O(h^2)
forward_oh = (func(x_val+h) - func(x_val))/h;
forward_oh2 = (-func(x_val+2*h) + 4*func(x_val+h) - 3*func(x_val))./(2.*h);
% kumpulkan pada matriks forward_diff
forward_diff(1,1) = forward_oh;
forward_diff(2,1) = forward_oh2;
% hitung error
forward_oh_err = abs((forward_oh - true_val)/true_val)*100;
forward_oh2_err = abs((forward_oh2 - true_val)/true_val)*100;
% kumpulkan pada matriks forward_diff
forward_diff(1,2) = forward_oh_err;
forward_diff(2,2) = forward_oh2_err;

% kalkulasi centered difference
% hitung O(h^2) dan O(h^4)
centered_oh2 = (func(x_val+h) - func(x_val-h))/(2.*h);
centered_oh4 = (-func(x_val+2*h)+8*func(x_val+h)-8*func(x_val-h)+func(x_val-2*h))/(12*h);
% kumpulkan pada matriks forward_diff
centered_diff(1,1) = centered_oh2;
centered_diff(2,1) = centered_oh4;
% hitung persentase error
centered_oh2_err = abs((centered_oh2 - true_val)/true_val)*100;
centered_oh4_err = abs((centered_oh4 - true_val)/true_val)*100;
% kumpulkan pada matriks forward_diff
centered_diff(1,2) = centered_oh2_err;
centered_diff(2,2) = centered_oh4_err;

% kalkulasi backward difference
% hitung O(h) dan O(h^2)
backward_oh = (func(x_val)-func(x_val-h))/h;
backward_oh2 = (3*func(x_val)-4*func(x_val-h)+func(x_val-2*h))/(2*h);
% kumpulkan pada matriks forward_diff
backward_diff(1,1) = backward_oh;
backward_diff(2,1) = backward_oh2;
% hitung error
backward_oh_err = abs((backward_oh - true_val)/true_val)*100;
backward_oh2_err = abs((backward_oh2 - true_val)/true_val)*100;
% kumpulkan pada matriks forward_diff
backward_diff(1,2) = backward_oh_err;
backward_diff(2,2) = backward_oh2_err;

% Problem 21.1
% true value: f'(pi/4) = 0.7071
% forward difference:
% O(h) = 0.6070, ei = 14.1538%
% O(h^2) = 0.7197, ei = 1.7867%
% centered difference:
% O(h^2) = 0.6991, ei = 1.1384%
% O(h^4) = 0.7070, ei = 0.0155%
% backward difference:
% O(h) = 0.7911, ei = 11.8770%
% O(h^4) = 0.7260, ei = 2.6737%
