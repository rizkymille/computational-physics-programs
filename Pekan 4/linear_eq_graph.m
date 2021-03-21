% Problem 9.7(a)
% x1 = x, x2 = y
x = linspace(-500, 500); % definisikan rentang x untuk diplot
% x2 diubah menjadi sumbu y dengan nama fungsi f
f1=0.5*x+9.5; % definisikan fungsi persamaan pertama
f2=(1.02*x+18.8)/2; % definisikan fungsi persamaan kedua
plot(x, f1, x, f2),grid % plot grafik
% ditemukan perpotongan pada koordinat x = 10 dan y = 14.5

% Problem 9.7(c)
% berdasarkan hasil determinan dan grafik, sistem persamaan ini mendekati
% kondisi penyelesaian tak hingga, sehingga disebut sistem ill-conditioned.
% secara grafik, sistem persamaan ini juga sulit dicari solusinya secara
% visual
