% no_2(a)
t = [122.6; 252.9; 1286.2; 2744.8; 425.6];
ID = [3.85; 3.25; 2.31; 1.77; 1.17];

n = length(t);
Y = log(ID);

for i=1:n
  G(i,1)=1;
  G(i,2)=t(i);
end

A = inv(transpose(G)*G)*transpose(G)*Y;

a=exp(A(1))
b=-A(2)

xx=linspace(min(t),max(t));
yy=A(1)+A(2)*xx;
plot(t,Y,'o',xx,yy,'-');
title("Fitting y=A*exp(-B*t)");
xlabel("t(menit)");
ylabel("%ID");
grid on



