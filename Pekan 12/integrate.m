function hasil = integrate(func, xmin, xmax, xmin_graph, xmax_graph)
% fungsi integrate, integral dan menghasilkan plot
% input:
% func = fungsi yang ingin di integrasi
% xmin = batas bawah integral
% xmax = batas atas integral
% xmin_graph = batas bawah rentang untuk plot
% xmax_graph = batas atas rentang untuk plot
% output:
% hasil = hasil integral

% gunakan batas bawah integral sebagai rentang bawah plot jika argumen
% dikosongkan
if nargin<4 || isempty(xmin_graph), xmin_graph = xmin; end
% gunakan batas atas integral sebagai rentang atas plot jika argumen
% dikosongkan
if nargin<5 || isempty(xmax_graph), xmax_graph = xmax; end

hasil = integral(func, xmin, xmax); % hitung integral fungsi

% plot fungsi
x_graph = linspace(xmin_graph, xmax_graph); % definisikan rentang plot
plot(x_graph, func(x_graph));

% Problem 20.7
% persamaan: dH = m*Cp(T)*dT
% Cp(T) = 0.132+1.56*1e-4*T+2.64*1e-7*T.^2, m = 1000 g
% dH = @(T) 1000*(0.132+1.56*1e-4*T+2.64*1e-7*T.^2)
% hasil = integrate(@(T) 1000*(0.132+1.56*1e-4*T+2.64*1e-7*T.^2), 0, 300, -100)
% hasil = 4.8996e+04