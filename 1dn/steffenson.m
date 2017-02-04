function t = steffenson (f, x0, tol)
  
  format long
  
  f = @(x) cos(x) - x;
  
  g = @ (x) x - (f(x) ^ 2) / (f(x + f(x)) - f(x));
  
  
  
  for i = 1:100
    t = g(x0)
    x0 = t;
    if abs(f(x0)) < tol
      break
    end
  end
  
  t;
  