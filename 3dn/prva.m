
f = @(x) sin(2 *pi*x);
a = zeros(41, 1);
for i = 0:40
    B = @(x) 0;
    for k = 0:i
        tmpp = i - k;
        tmp = @(x)nchoosek(i, k).*(x.^k).*(1-x).^tmpp;
        B = @(X) B(x) + tmp(x);
    end   
  residual = 0;
  %namesto tega lahko poiscem matlab funkcijo, 
  %ki poisce neskoncno normo razlike teh dveh funkicij
  for j = 0:100
    if abs(f(j/100)-B(j/100)) > residual
      residual = abs(f(j/100)-B(j/100));
    end
  end
  residual;
  a(i+1) = residual(1);
end
  
plot(i, a(i))
  
%vrne najmanjso stopnjo, pri kateri je napaka manjsa od 0.1
for i = 0:40
  if a(i+1) < 0.1
    i
    break
   end
end
  
  
  
  
   
      
    