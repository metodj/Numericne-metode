f = @(x) (x+1)/(x^+1);
E = [-3 -1 0 1 3];

%remesov algoritem, dobim p

%r = @(x) f(x) - p(x)

%plot(f, [-3,3])
%plot(p, [-3,3])
%plot(r, [-3,3])

%vrednosti v konèni ali zaèetni množici E?
%R = zeros(5, 1);
%for i=1:5
%  R(i) = r(E(i))
%end

%fminbnd vrne minimum funkcije, je za max uredu ce vzamem fminbnd od -r(x)?
%a = fminbnd(-r, -3, 3)