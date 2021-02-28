% cara penggunaan:
% ketik pada command window MATLAB: 'false_position(@(x) fungsi, xlow, xup,
% stop_criterion)
% contoh: false_position(@(x) x^2, -1, 1, 2)
function xroot = false_position(func, xlow, xup, stop_criterion)

if nargin < 4
    error('Argumen kurang')
elseif nargin > 4
    error('Argumen terlalu banyak')
end

flow = func(xlow); fup = func(xup);
xroot = (xlow + xup)/2;
xroot_old = xroot;
err_abs = abs((xroot-xroot_old)/xroot)*100;
iu = 0; il = 0;
while err_abs == 0 || err_abs > stop_criterion
    xroot_old = xroot;
    xroot = xup - (fup*(xlow - xup))/(flow - fup);
    err_abs = abs((xroot-xroot_old)/xroot)*100;
    fprintf('Kesalahan absolut: %f\n', err_abs)
    
    if flow*fup < 0
        xup = xroot;
        fup = func(xup);
        il = il + 1;
        if il >= 2
           flow = flow/2;
        end
    elseif flow*fup > 0
        xlow = xroot;
        flow = func(xlow);
        iu = iu + 1;
        if iu >= 2
           fup = fup/2;
        end
    else
        err_abs = 0;
    end
end

end