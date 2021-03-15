function result = linealg_calc(A,B)
% fungsi mencari solusi aljabar linier dengan matriks
% input:
% A = matriks koefisien
% B = matriks konstanta
% output:
% result = hasil pembagian kedua matriks
result = A\B;
end

% Problem 8.5
% A = [3+2i 4; -i 1], B = [2+i; 3]
% linealg_calc([3+2i 4; -i 1], [2+i; 3])
% z1 = -0.5333 + 1.4000i, z2 = 1.6000 - 0.5333i

% Problem 8.13
% Permodelan:
% -k*x1 = m1*g, -k*x2 = m2*g, dan -k*x3 = m3*g
% A = -10; -10; -10], B = [m1*g; m2*g; m3*g]
% m1 = 2; m2 = 3; m3 = 2.5; g = 9.81; k = 10;
% linealg_calc([-10; -10; -10], [m1*g; m2*g; m3*g])
% x = -2.4525