function bracket = incsearch(func, xmin, xmax)
% fungsi incremental search, untuk mencari bracket dari suatu interval
% input:
% func = fungsi yang ingin dicari (misal x^2, x^3, dll)
% xmin = interval minimum pencarian bracket
% xmax = interval maksimum pencarian bracket
% output:
% bracket = interval nilai x yang mempunyai akar didalamnya. output sebagai
% matriks dengan dua kolom. kolom sebelah kiri adalah xl dan kolom
% sebelah kanan adalah xu

% output pesan error ketika argumen input fungsi kurang atau lebih
if nargin < 3 % cek apakah jumlah argumen kurang dari 3
    error('Argumen kurang')
elseif nargin > 3 % cek apakah jumlah argumen lebih dari 3
    error('Argumen terlalu banyak')
end

x = linspace(xmin, xmax); % buat x sebagai rentang angka dari xmin sampai xmax
f = func(x); % buat f sebagai variabel hasil fungsi dari nilai-nilai x
num_brackets = 0; % inisialisasi variabel jumlah bracket yang ditemukan
bracket = []; % prealokasi array sebagai daftar bracket yang ditemukan
for i = 1:length(x) - 1 % pengulangan sebanyak nilai i, dari 1 sampai banyaknya angka x dikurang 1
    if sign(f(i)) ~= sign(f(i+1))
        % nilai fungsi sekarang dan setelahnya 'diratakan' menjadi nilai
        % -1, 0, atau 1
        % sehingga jika nilai fungsi sekarang dan setelahnya berbeda, bisa
        % dipastikan grafik melewati sumbu x sehingga mempunyai akar
        
        % jika ditemukan interval bracket, lakukan program dibawah
        num_brackets = num_brackets + 1; % naikkan variabel jumlah bracket yang ditemukan
        bracket(num_brackets, 1) = x(i); % masukkan interval terendah dalam kolom 1 array
        bracket(num_brackets, 2) = x(i+1); % masukkan interval tertinggi dalam kolom 2 array
    end
end

% output pesan ketika bracket ditemukan atau tidak
if isempty(bracket) % cek apakah bracket kosong
    fprintf('Tidak ditemukan bracket\n')
else
    fprintf('Jumlah bracket ditemukan: %d\n', num_brackets)
end

end

% No. 1 Fungsi Problem 5.1
% m = 95; g = 9.81; v = 46; t = 9;
% incsearch(@(cd) sqrt(g.*m./cd).*tanh(sqrt(g.*cd./m).*t) - v, 0, 500)
% Jumlah bracket ditemukan: 1
% xlow = 0, xup = 5.0505

% No. 1 Fungsi Problem 5.7
% incsearch(@(x) -12-21*x+18*x.^2-2.75*x.^3, -100, 100)
% Jumlah bracket ditemukan: 3
% xlow = -1.0101, xup = 1.0101
% xlow = 1.0101, xup = 3.0303
% xlow = 3.0303, xup = 5.0505