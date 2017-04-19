format long

f = @(x) sin(2 *pi*x);
a = zeros(40, 1);
for n = 1:40
  B = bernstein(f, n);
  res = @(x) abs(f(x)-B(x));
  %namesto tega lahko poiscem matlab funkcijo, 
  %ki poisce neskoncno normo razlike teh dveh funkicij
  residual = 0;
  for j = 0:100
    if res(j/100) > residual
      residual = res(j/100);
    end
  end
  a(n) = residual;
end

a

% graf napake v odvisnosti od stopnje polinoma
plot(1:40, a)
  
%vrne najmanjso stopnjo, pri kateri je napaka manjsa od 0.1
j = 1;
while a(j)>0.1
  j = j + 1;
end

j
  
  
  
  
   
      
    