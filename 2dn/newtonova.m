function t = newtonova (a)
  
  t = [1, 1, 1];
  F = @(x, y, z) [x^2 + y^2 + z^2 - a;
                  2*x^2 + y^2 - 4*z;
                  3*x^2 - 4*y + z^2];
  
  JF = @(x, y, z) [2*x, 2*y, 2*z;
                   4*x, 2*y, 4;
                   6*x, 4, 2*z];
  
  for k = 1:2
    y = linsolve(JF (t(1), t(2), t(3)), - F (t(1), t(2), t(3)));
    t = t + transpose(y);
  end
  
  
  
  
    
    

    
  