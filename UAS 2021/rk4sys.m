function [tp,yp] = rk4sys(dydt,tspan,y0,h)
% rk4sys: fungsi Metode Runge-Kutta untuk orde empat sistem ODE.
% Input:
% dydt = M-file fungsi ODE
% tspan = [ti, tf]; waktu awal dan akhir dengan output dihasilkan pada
% interval h, atau
% = [t0 t1 ... tf]; waktu spesifik output solusi
% y0 = nilai awal variabel dependen
% h = nilai penambahan/step
% Output:
% tp = vektor variabel independen
% yp = vektor variabel solusi dependen
if nargin<4
    error('Argumen kurang!')
end

if any(diff(tspan)<=0)
    error('tspan tidak berurut naik!')
end

n = length(tspan);
ti = tspan(1);
tf = tspan(n);

if n == 2
    t = (ti:h:tf)'; 
    n = length(t);
    if t(n)<tf
        t(n+1) = tf;
    end
else
    t = tspan;
end

tt = ti; 
y(1,:) = y0;
np = 1; 
tp(np) = tt; 
yp(np,:) = y(1,:);
i=1;

while(1)
    tend = t(np+1);
    hh = t(np+1) - t(np); 
    if hh > h
        hh = h;
    end
    while(1)
        if tt+hh>tend
            hh = tend-tt;
        end
        k1 = dydt(tt,y(i,:))';
        ymid = y(i,:) + k1.*hh./2;
        k2 = dydt(tt+hh/2,ymid)';
        ymid = y(i,:) + k2*hh/2;
        k3 = dydt(tt+hh/2,ymid)';
        yend = y(i,:) + k3*hh;
        k4 = dydt(tt+hh,yend)';
        phi = (k1+2*(k2+k3)+k4)/6;
        y(i+1,:) = y(i,:) + phi*hh;
        tt = tt+hh;
        i=i+1;
        if tt>=tend
            break
        end
    end
    np = np+1; tp(np) = tt; yp(np,:) = y(i,:);
    if tt>=tf
        break
    end
    
% fungsi analitik
t = linspace(0, 20);
v = sqrt(9.81*65/0.15)*tanh(sqrt(9.81*0.15/65*t));

plot(y(:,1),y(:,2), t, v)
end