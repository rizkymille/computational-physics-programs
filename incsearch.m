% cara penggunaan:
% ketik pada command window MATLAB: 'incsearch(@(x) fungsi, xmin, xmax)
% contoh: incsearch(@(x) x^2, -1, 1)
function bracket = incsearch(func, xmin, xmax)

if nargin < 3
    error('Argumen kurang')
elseif nargin > 3
    error('Argumen terlalu banyak')
end

x = linspace(xmin, xmax);
f = func(x);
num_brackets = 0;
bracket = [];
for i = 1:length(cd) - 1
    if sign(f(i)) ~= sign(f(i+1))
        num_brackets = num_brackets + 1;
        bracket(num_brackets, 1) = f(i);
        bracket(num_brackets, 2) = f(i+1);
    end
end

if isempty(bracket)
    fprintf('Tidak ditemukan bracket\n')
else
    fprintf('Jumlah bracket ditemukan: %d\n', num_brackets)
end

end