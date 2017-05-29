%enojni integral
f = @(x) x.*exp(x);
m = 10;
a = 0;
b = 1;
h = (b-a)/(2*m);

xtocke = zeros(2*m+1,1);
koef1 = zeros(2*m+1,1);
koef1(1) = 1;
koef1(2*m+1) = 1;

for i=1:(2*m+1)
    xtocke(i)= a + (i-1)*h;
end

for j=2:(2*m)
    if (rem(j,2) == 0)
        koef1(j) = 4;
    else
        koef1(j) = 2;
    end
end

Sf1 = 0;
for i=1:(2*m+1)
    Sf1 = Sf1 + koef1(i)*f(xtocke(i));
end
Sf1 = Sf1*h/3;
I1 = quad(@(x)f(x),a,b,1e-12);
Sf1
razlika1 = abs(I1-Sf1);

%dvojni integral, interval [a,b] enak kot pri enojnem
g = @(x,y)x.*y.*exp(x+y);
c = 1;
d = 3;
m2 = 15;
k = (d-c)/(2*m2);

ytocke = zeros(2*m2+1,1);
koef2 = zeros(2*m2+1,1);
koef2(1) = 1;
koef2(2*m2+1) = 1;

for i=1:(2*m2+1)
    ytocke(i)= c + (i-1)*k;
end

for j=2:(2*m2)
    if (rem(j,2) == 0)
        koef2(j) = 4;
    else
        koef2(j) = 2;
    end
end

Sf2=0;
for i = 1:(2*m+1)
    for j = 1:(2*m2+1)
        Sf2 = Sf2 + koef1(i)*koef2(j)*g(xtocke(i),ytocke(j));
    end
end

Sf2 = Sf2*(h*k)/9;

%tu sem uporabil integral2, pazi mogoce bi moral dblquad z 
%dovolj visoko toleranco!
Sf2
I2 = integral2(@(x,y)g(x,y),a,b,c,d);
razlika2 = abs(Sf2-I2);

%TROJNI INTEGRAL
w = @(x,y,z) x.*y.*z.*exp(x+y+z);
e = -1/2;
f = 0;
m3 = 7;
l = (f-e)/(2*m3);

ztocke = zeros(2*m3+1,1);
koef3 = zeros(2*m3+1,1);
koef3(1) = 1;
koef3(2*m3+1) = 1;

for i=1:(2*m3+1)
    ztocke(i)= e + (i-1)*l;
end

for j=2:(2*m3)
    if (rem(j,2) == 0)
        koef3(j) = 4;
    else
        koef3(j) = 2;
    end
end

Sf3=0;
for i = 1:(2*m+1)
    for j = 1:(2*m2+1)
        for u = 1:(2*m3+1)
            Sf3 = Sf3 + koef1(i)*koef2(j)*koef3(u)*w(xtocke(i),ytocke(j),ztocke(u));
        end
    end
end

Sf3 = Sf3*h*k*l/27;
Sf3
%izracunaj se tocen trojni integral in razliko(na primeren nacin)

