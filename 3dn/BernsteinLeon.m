function d = BernsteinLeon(m)
  format long

  f = @(x) sin(2*pi*x);
  z = zeros(m,1);
  for n = 1:m
    for i = 0:100
      x = i / 100;
      b = 0;
      
      for j = 1:n
        b = b + f(j/n)*nchoosek(n,j)*x^j*(1 - x)^(n-j);
      end
   
      z(n) = max(z(n), abs(b - f(x)));
    end
  end
  d = z;
  %plot(1:m,d)