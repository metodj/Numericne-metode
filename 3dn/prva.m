function = prva(f)
  
  %f = @(x) sin(2 *pi*x)
  a = zeros(41, 1);
  for i = 0:40
    B = @(x) bernstein(f, i, x);
    residual = 0;
    %namesto tega lahko poiscem matlab funkcijo, 
    %ki poisce neskoncno normo razlike teh dveh funkicij
    for i = 0:100
      if abs(f(i/100)-B(i/100)) > residual
        residual = abs(f(i/100)-B(i/100));
      end
    end
    a(i) = residual;
  end
  
  plot(i, a(i))
  
  %vrne najmanjso stopnjo, pri kateri je napaka manjsa od 0.1
  for i = 0:40
    if a(i) < 0.1
      i
      break
    end
  end
  
  
  
  
   
      
    