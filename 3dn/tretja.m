format long

f = @(x) exp(x.*(x+1));

g1 = @(x) 1*ones(size(x));
g2 = @(x) sin(x);
g3 = @(x) cos(x);
g4 = @(x) sin(x).*cos(x);

A = [quad(@(x)g1(x).*g1(x),-1,1,1e-12) quad(@(x)g2(x).*g1(x),-1,1,1e-12) quad(@(x)g3(x).*g1(x),-1,1,1e-12) quad(@(x)g4(x).*g1(x),-1,1,1e-12);
     quad(@(x)g1(x).*g2(x),-1,1,1e-12) quad(@(x)g2(x).*g2(x),-1,1,1e-12) quad(@(x)g3(x).*g2(x),-1,1,1e-12) quad(@(x)g4(x).*g2(x),-1,1,1e-12);
     quad(@(x)g1(x).*g3(x),-1,1,1e-12) quad(@(x)g2(x).*g3(x),-1,1,1e-12) quad(@(x)g3(x).*g3(x),-1,1,1e-12) quad(@(x)g4(x).*g3(x),-1,1,1e-12);
     quad(@(x)g1(x).*g4(x),-1,1,1e-12) quad(@(x)g2(x).*g4(x),-1,1,1e-12) quad(@(x)g3(x).*g4(x),-1,1,1e-12) quad(@(x)g4(x).*g4(x),-1,1,1e-12)];

%grammova matrika
A

b = [quad(@(x)f(x).*g1(x),-1,1,1e-12), quad(@(x)f(x).*g2(x),-1,1,1e-12), quad(@(x)f(x).*g3(x),-1,1,1e-12), quad(@(x)f(x).*g4(x),-1,1,1e-12)]';

b

m = linsolve(A, b);

%koeficienti polinoma
m

p = @(x) m(1).*g1(x) + m(2).*g2(x) + m(3).*g3(x) + m(4).*g4(x);

r = @(x) f(x) - p(x);

norma = sqrt(quad(@(x)r(x).*r(x),-1,1,1e-12))


fplot(f, [-1,1])
fplot(p, [-1,1])
     