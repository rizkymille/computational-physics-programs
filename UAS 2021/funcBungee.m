function dy = funcBungee(t,y)
dy = [y(2); 9.81-0.25/65*y(2)^2];