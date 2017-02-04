function [t, n] = polinom (x, y)
  
  n = size(x);
  V = zeros(n);
  
% zakaj ne dela pravilno??
 
  for i = 1:n
    for j = 1:n
      V(i, j) = x(i)^(j - 1);
    end
  end
  
  cond(V);
  eksaktni_a = zeros(n, 1);
  eksaktni_a (2) = 1;
  t = linsolve (V, y);
  razlika = eksaktni_a .- t;
  n = norm(razlika);
  
  
  
  
    
      
      
      