function dy = dydt_b(t,y)
c = 4;
dy = [y(2); -y(1)-c.*y(2)];