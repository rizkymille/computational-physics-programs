% no_1
t = [0 25 50 75 100 125];
y = [0 32 58 78 92 100];

% mencari diferensial numerik
d = diff(y)./diff(t);

n = length(t);
tm = (t(1:n-1)+t(2:n))./2;

plot(tm,d,'-')