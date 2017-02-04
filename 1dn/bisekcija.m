function t = bisekcija
  
  f = @(x)  (x / 2) - atan(x);
%  x = linspace(0, 3);
%  plot(x, f(x))
  
  a = 1;
  b = 3;
  for k = 1:5
    c = (a + b) / 2;
    if f(a) * f(c) < 0
      b = c;
    elseif f(b)*f(c)<0
      a = c;
    end 
  end
  
  
  g = @ (x) 2 * atan(x);
  x0 = (a + b) / 2
  x1 = g(x0);
  t = g(x1);
  
  
  
  
 
  
  
 
 