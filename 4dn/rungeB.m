%vsi parametri iz DN
f = @(x,y) 1+(x-y).^2;
h = 1/10;
a=3;
b=4;

xtocke = zeros(11,1);
for i=1:11
    xtocke(i) = a+(i-1)*h;
end

gama = [1/8 3/8 3/8 1/8]';
alfa = [0 1/3 2/3 1]';
beta = [0 0 0 0; 1/3 0 0 0; -1/3 1 0 0; 1 -1 1 0];

y = zeros(11,1);
y(11)=5; %zacetni pogoj

for i=10:-1:1
    k1 = @(z) h.*f(xtocke(i)+h.*alfa(1),z);
    k2 = @(z) h.*f(xtocke(i)+h.*alfa(2),z+beta(2,1).*k1(z));
    k3 = @(z) h.*f(xtocke(i)+h.*alfa(3),z+beta(3,1).*k1(z)+beta(3,2).*k2(z));
    k4 = @(z) h.*f(xtocke(i)+h.*alfa(4),z+beta(4,1).*k1(z)+beta(4,2).*k2(z)+beta(4,3).*k3(z));
    kao = @(z) -y(i+1)+z+gama(1).*k1(z)+gama(2).*k2(z)+gama(3).*k3(z)+gama(4).*k4(z);
    y(i) = fzero(kao, y(i+1));
end

y

    