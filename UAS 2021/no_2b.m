t = 0:1:1000;
ID = 2.6543*exp(-1.6329*1e-04*t);

% menggunakan fungsi integral trapezoidal
hasil = integrate_trapezoidal(t,ID)

% plotting
plot(t,ID);
title("Metode Trapezoidal");
xlabel("t(menit)");
ylabel("%ID");
grid on;

