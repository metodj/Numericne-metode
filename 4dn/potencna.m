function L = potencna(n)

A = zeros(n);
for i = 1:10
    for j = 1:10
        A(i,j) = (-1)^(1-i-j)*abs(i-j);
    end
end

z = zeros(n, 1);
z(1) = 1;

I = eye(n);
%sam doloci priblizek
priblizek = 3;

%premik
A2 = inv(A - priblizek*I);

%inverzna potencna metoda s premikom (=implentiral sem potencno metodo za
%A2, kar je isto)
k = 0;
y = A2*z;
L = z'*y;
tol=1e-8;

%ali je zaustavitveni pogoj uredu napisan? 
while (norm(y-L*z)>tol)&&(k<1000)
    z = y/norm(y);
    y = A2*z;
    L = z'*y;
    k = k+1;
end

%uporabim dobljen lastni vektor za izracun iskane lastne vrednosti pri
%danem priblizku
L = z' * A * z;
    
    


    
    
    


