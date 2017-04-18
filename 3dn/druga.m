format long

f = @(x) (x+1)/(x^2+1);
E = [-3 -1 0 1 3];

A = zeros(5,5);
for i = 1:5
  for j = 1:4
    A(i,j)=E(i)^(j-1);
  end
  A(i,5)=(-1)^i;
end
A;

y = zeros(5,1);
for i=1:5
  y(i)=f(E(i));
end
y;


koef = linsolve(A,y)

p = @(x) koef(1) + koef(2)*x + koef(3)*x^2 + koef(4)*x^3;
r = @(x) f(x) - p(x);

res = zeros(5,1);
for i=1:5
  res(i) = r(E(i));
end
res

r1 = @(x) -abs(r(x));

a = fminbnd(r1, 0, 3)
b = fminbnd(r1, -3, 0)