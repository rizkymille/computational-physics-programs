function [xroot] = fungsiroket(t)
g = 9.81; % gravitasi
u = 1800; % kecepatan dilepaskannya
m0 = 16*1e4; % massa t = 0
q = 2600; % laju konsumsi bahan bakar 
v = u.*log(m0./(m0-q.*t)) - g.*t;
plot(t, v);
xlabel('waktu');
ylabel('kecepatan');
tlow = min(t);
tup = max(t);
stop_criterion = input('Masukkan batas error: ');
v_meas = input('Masukkan kecepatan yang ingin dicari waktunya: ');
xroot = bisection(@(t) u.*log(m0./(m0-q.*t)) - g.*t - v_meas, tlow, tup, stop_criterion);
end

function xroot = bisection(func, xlow, xup, stop_criterion)
flow = func(xlow); fup = func(xup);
xroot = (xlow + xup)/2; 
err_abs = 100;

iter = 0;
while err_abs >= stop_criterion
    iter = iter + 1;
    xroot_old = xroot;
    xroot = (xlow + xup)/2;
    
    if iter > 1
        err_abs = abs((xroot-xroot_old)/xroot)*100;
        fprintf('Kesalahan absolut: %f\n', err_abs)
    end
    
    if flow*func(xroot) < 0
        xup = xroot;
    elseif func(xroot)*fup > 0
        xlow = xroot;
    else
        break
    end
end

end