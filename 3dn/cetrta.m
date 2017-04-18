format long

x = [0, pi/12, pi/6, pi/3, pi/2]';
y = zeros(5, 1);
i=1;
for elem = x'
  y(i)=sin(elem);
  i = i + 1;
end

d = delj_dif(x, y);
p = @(x) d(1) + d(2)*x + d(3)*x*(x-pi/12) + d(4)*x*(x-pi/12)*(x-pi/6) + d(5)*x*(x-pi/12)*(x-pi/6)*(x - pi/3);

%p(0)
%p(pi/12)
%p(pi/6)
%p(pi/3)
%p(pi/2)

d2 = delj_dif(y, x);
q = @(x) d2(1) + d2(2)*(x-y(1)) + d2(3)*(x-y(1))*(x-y(2)) + d2(4)*(x-y(1))*(x-y(2))*(x-y(3)) + d2(5)*(x-y(1))*(x-y(2))*(x-y(3))*(x-y(4));

%q(y(1))
%q(y(2))
%q(y(3))
%q(y(4))
%q(y(5))

A = zeros(11,4);

for i=0:10
  A(i+1,1) = i;
  A(i+1,2) = i * (pi/20);
  A(i+1,3) = p(q(i*pi/20));
  A(i+1,4) = q(p(i*pi/20));
end
  
A
