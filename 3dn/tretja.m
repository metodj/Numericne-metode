format long

f = @(x) exp(x*(x+1));

A = [quad(@(x)1,-1,1,1e-12) quad(@(x)sin(x),-1,1,1e-12) quad(@(x)cos(x),-1,1,1e-12) quad(@(x)sin(x).*cos(x),-1,1,1e-12);
     quad(@(x)sin(x),-1,1,1e-12) quad(@(x)sin(x).*sin(x),-1,1,1e-12) quad(@(x)cos(x).*sin(x),-1,1,1e-12) quad(@(x)sin(x).*cos(x).*sin(x),-1,1,1e-12);
     quad(@(x)cos(x),-1,1,1e-12) quad(@(x)sin(x).*cos(x),-1,1,1e-12) quad(@(x)cos(x).*cos(x),-1,1,1e-12) quad(@(x)sin(x).*cos(x).*cos(x),-1,1,1e-12);
     quad(@(x)sin(x).*cos(x),-1,1,1e-12) quad(@(x)sin(x).*sin(x).*cos(x),-1,1,1e-12) quad(@(x)cos(x).*sin(x).*cos(x),-1,1,1e-12) quad(@(x)sin(x).*cos(x).*sin(x).*cos(x),-1,1,1e-12)];

b = [quad(@(x)f(x),-1,1,1e-12) quad(@(x)f(x).*sin(x),-1,1,1e-12) quad(@(x)f(x).*cos(x),-1,1,1e-12) quad(@(x)f(x).*sin(x).*cos(x),-1,1,1e-12)]';

m = linsolve(A, b);

p = @(x) m(1) + m(2)*sin(x) + m(3)*cos(x) + m(4)*sin(x)*cos(x);

r = @(x) f(x) - p(x);

%ali je to pravi izraèun druge norme residuala?
quad(@(x)r(x).*r(x),-1,1,1e-12)


%plot(f, [-1,1])
%plot(p, [-1,1])
     