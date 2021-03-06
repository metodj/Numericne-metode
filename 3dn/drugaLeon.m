  f = @(x) (x+1)/(x^2+1);
  x = [-3;-1;0;1;3];
  
  A = zeros(5,5);
  for i = 1:5
    for j = 1:4
      A(i,j) = x(i)^(j-1);
    end
    A(i,5) = (-1)^i;
  end
  A
  y = [f(-3);f(-1);f(0);f(1);f(3)];
  y
  p1 = linsolve(A,y)
  p = @(x) p1(1) + p1(2)*x + p1(3)*x^2 + p1(4)*x^3;
  
  r = @(x) (x+1)/(x^2+1) -(p1(1) + p1(2)*x + p1(3)*x^2 + p1(4)*x^3);
  
  r1 = zeros(5,1);
  for i=1:5
    r1(i) = y(i) - p(x(i));
  end
  r2 = @(x) -abs((x+1)/(x^2+1) -(p1(1) + p1(2)*x + p1(3)*x^2 + p1(4)*x^3));
  t = fminbnd(r2,0,3)
  t1 = fminbnd(r2,-3,0)
  r2(t)
  r2(1.829369026422500)
  z = -3:0.01:3;
  %plot(z,-abs((z+1)/(z.^2+1) -(p1(1) + p1(2).*z + p1(3).*z.^2 + p1(4).*z.^3)))