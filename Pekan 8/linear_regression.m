function [grad, intercept, r2, stderror_estimate] = linear_regression(x,y)

n = length(x)

if length(y)~=n, error('Jumlah data x dan y haruslah sama'); end % kasus data asimetris

% penjumlahan variabel untuk kalkulasi
sum_x = sum(x)
sum_y = sum(y)
sum_x_square = sum(x.*x)
sum_y_square = sum(y.*y)
sum_x_y = sum(x.*y)

% gradien
grad = (n*sum_x_y-sum_x*sum_y)/(n*sum_x_square-sum_x^2)
% intercept/konstanta
intercept = sum_y/n-grad*sum_x/n
% korelasi
r2 = ((n*sum_x_y-sum_x*sum_y)/sqrt(n*sum_x_square-sum_x^2)/sqrt(n*sum_y_square-sum_y^2))^2
% jumlah kuadrat
sum_of_squares = sum((y-intercept-grad*x).^2)
% estimasi standar error
stderror_estimate = sqrt(sum_of_squares/(n-2))

% pembuatan plot
x_plot = linspace(min(x),max(x));
y_plot = grad*x_plot+intercept; 
plot(x,y,'o',x_plot,y_plot)
end

% Problem 14.5
% input:
% >> [grad, intercept, r2, stderror_estimate] = linear_regression([0 2 4 6 9 11 12 15 17 19], [5 6 7 6 9 8 8 10 12 12])
% output:
% grad = 0.3591
% intercept = 4.8881
% r2 = 0.8929
% stderror_estimate = 0.8511

% variabel ditukar
% >> [grad, intercept, r2, stderror_estimate]= linear_regression([5 6 7 6 9 8 8 10 12 12], [0 2 4 6 9 11 12 15 17 19])
% output:
% grad = 2.4861
% intercept = -11.1349
% r2 = 0.8929
% stderror_estimate = 2.2393

% Problem 14.7
% turunkan persamaan ideal gas untuk mencari R dengan gradien regresi linier 
% pV = nRT
% p = nR/V T
% grad = nR/V
% R = V*grad/n
% input:
% >> T = [-40 0 40 80 120 160];
% >> p = [6900 8100 9350 10500 11700 12800];
% >> V = 10; n = 1000/14.0067;
% >> grad = linear_regression(T,p);
% >> R = V*grad/n
% output:
% R = 4.1470

% Problem 14.20
% >> time = [10 15 20 25 40 50 55 60 75];
% >> tensile_strength = [5 20 18 40 33 54 70 60 78];
% >> [grad, intercept] = linear_regression(time,tensile_strength);
% (a) 
% >> tensile_strength_32_a = grad*32+intercept
% output:
% tensile strength ketika menit 32 = 34.7049
% (b)
% >> tensile_strength_32_b = grad*32
% output:
% tensile strength ketika menit 32 = 33.8870