function result = gauss_naive(aug_matrix)
% fungsi eliminasi gauss secara naif
% input:
% aug_matrix_matrix = matriks diperbesar
% output:
% result = solusi persamaan
[m,n] = size(aug_matrix); % definisikan ukuran baris dan kolom matriks diperbesar sebagai variabel m dan n
if m~=n-1, error('Matriks koefisien harus persegi'); end % jika matriks koefisien tidak persegi, maka keluarkan error
% eliminasi maju
for k = 1:n-2 %  pengulangan kolom yang akan dieliminasi sebagai indeks k
    for i = k+1:n-1 %  pengulangan baris yang akan dieliminasi sebagai indeks i
        factor = aug_matrix(i,k)/aug_matrix(k,k); % hitung faktor eliminasi
        aug_matrix(i,k:n) = aug_matrix(i,k:n)-factor*aug_matrix(k,k:n); % kalkulasi matriks baru hasil eliminasi
    end
end
% substitusi kembali
result = zeros(n-1,1); % definisikan matriks solusi persamaan sebagai matriks berisi 0 dengan ukuran banyaknya kolom koefisien
result(n-1) = aug_matrix(n-1,n)/aug_matrix(n-1,n-1); % masukkan variabel yang telah mempunyai solusi (paling bawah) kedalam matriks solusi
for i = n-1:-1:1 % pengulangan substitusi diurutkan dari matriks paling bawah ke atas, dengan indeks i
    result(i) = (aug_matrix(i,n)-aug_matrix(i,i+1:n-1)*result(i+1:n-1))/aug_matrix(i,i); % substitusi matriks
end

% Problem 9.8(a)
% gauss_naive([10 2 -1 27; -3 -6 2 -61.5; 1 1 5 -21.5])
% x1 = 0.5, x2 = 8, x3 = -6

% Problem 9.8(b)
% 10*x1+2*x2-x3==27
% ans = 1 (terbukti)
% -3*x1-6*x2+2*x3==-61.5
% ans = 1 (terbukti)
% x1+x2+5*x3==-21.5
% ans = 1 (terbukti)
