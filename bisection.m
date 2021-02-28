function xroot = bisection(func, xlow, xup, stop_criterion)

if nargin < 4
    error('Argumen kurang')
elseif nargin > 4
    error('Argumen terlalu banyak')
end

flow = func(xlow); fup = func(xup);
xroot = (xlow + xup)/2;
xroot_old = xroot;
err_abs = abs((xroot-xroot_old)/xroot)*100;
while err_abs == 0 || err_abs >= stop_criterion
    xroot_old = xroot;
    xroot = (xlow + xup)/2;
    
    err_abs = abs((xroot-xroot_old)/xroot)*100;
    fprintf('Kesalahan absolut: %f\n', err_abs)
    
    if flow*fup < 0
        xup = xroot;
    elseif flow*fup > 0
        xlow = xroot;
    else
        err_abs = 0;
    end
end

end