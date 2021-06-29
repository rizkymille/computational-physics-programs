function dy = dydt_b(t,y)
c = 0.5;
dy = [y(2); -y(1)-c.*y(2)];