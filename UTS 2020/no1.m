% No 1. (a) & (b)
t = linspace(0,0.8);
q0 = 10*1e-3; R = 60; L = 9; C = 5*1e-6;
q = q0.*exp(-(R.*t)./(2.*L)).*cos(t.*sqrt(1./(L.*C)-(R./(2.*L)).^2));
plot(t,q)
xlabel('t')
ylabel('q')