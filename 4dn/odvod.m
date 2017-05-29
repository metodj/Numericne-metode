
format long

f =  @(x) exp(-2*x) + cos(5*x);
der = @(x) -2*exp(-2*x) - 5*sin(5*x);
der2 = @(x) 4*exp(-2*x) - 25*cos(5*x);

h = 1/20;
A = zeros(23,7);
for i = 1:23
    A(i,1) = i;
    A(i,2) = (i-2)*h;
    A(i,3) = f(A(i,2));
end

for i = 2:22
    A(i,4) = (A(i+1,3)-A(i-1,3))/(2*h);
    A(i,5) = (A(i-1,3)-2*A(i,3)+A(i+1,3))/(h^2);
    A(i,6) = der(A(i,2));
    A(i,7) = der2(A(i,2));
end

A

%plot...

plot(A(2:22,2),A(2:22,4)); hold
plot(A(2:22,2),A(2:22,6));

plot(A(2:22,2),A(2:22,5)); hold
plot(A(2:22,2),A(2:22,7));

%neskoncni normi za prvi in drugi odvod
prvi = max(abs(A(:,4)-A(:,6)))
drugi = max(abs(A(:,5)-A(:,7)))

