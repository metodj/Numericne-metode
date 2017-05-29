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
y(1)=1; %zacetni pogoj

k = zeros(4,1); %4 ker je 4-stopenjska runge kutta metoda
for i=2:11
    k(1) = h*f(xtocke(i-1)+alfa(1)*h,y(i-1));
    k(2) = h*f(xtocke(i-1)+alfa(2)*h,y(i-1)+beta(2,1)*k(1));
    k(3) = h*f(xtocke(i-1)+alfa(3)*h,y(i-1)+beta(3,1)*k(1)+beta(3,2)*k(2));
    k(4) = h*f(xtocke(i-1)+alfa(4)*h,y(i-1)+beta(4,1)*k(1)+beta(4,2)*k(2)+beta(4,3)*k(3));
    y(i)=y(i-1);
    for j=1:4
        y(i)=y(i)+gama(j)*k(j);
    end
end

%grafièni prikaz rešitve toèke a) 
%plot(xtocke,y)

%izracunane vrednosti pri toèki a)
y







