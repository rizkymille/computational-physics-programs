function yi = TableLook(x, y, xx)
n = length(x);
if xx < x(1) || xx > x(n)
    error('Interpolasi diluar jangkauan')
end
% pencarian berurutan/sekuensial
i = 1;
while(1)
    if xx <= x(i + 1)
        break
    end
    i = i + 1;
end
% interpolasi linier
yi = y(i) + (y(i+1)-y(i))/(x(i+1)-x(i))*(xx-x(i));