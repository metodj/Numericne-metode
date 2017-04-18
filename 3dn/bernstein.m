function B = bernstein(f, n)
  
  B = @(x) 0;
  for i = 1:n
    tmp = @(x) f(i/n)*nchoosek(n,i)*(x^i)*(1-x)^(n-i);
    B = @(x) B(x) + tmp(x);
  end
    