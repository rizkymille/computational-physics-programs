function I=integrate_trapezoidal(x,y)
  I=0;
  n=length(x)-1;
  for i=1:n
    I= I+(x(i+1) - x(i) )*( y(i) + y(i+1) )/2;
  end
  
end