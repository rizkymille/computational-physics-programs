function yroot = graphic(func, xmin, xmax)

if nargin < 3
    error('Argumen kurang')
elseif nargin > 3
    error('Argumen terlalu banyak')
end

x = linspace(xmin, xmax);
f = func(x);
plot(x, f), grid
xroot = input('Masukkan koordinat akar x dari grafik: ');
yroot = func(xroot);

end