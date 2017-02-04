function x = linSPD (A, b)
  
  n = size(A)(1);
  V = zeros (n);
  y = zeros(n, 1);
  x = zeros(n, 1);
  
% razcep choleskega
  for j = 1:n
    for k = 1:(j-1)
      A(j,j) = A(j,j) - V(j,k)^2;
    end
    V(j,j) = sqrt(A(j,j));
    for i = (j+1):n
      for k = 1:(j-1)
        A(i, j) = A(i,j) - V(i,k)*V(j,k);
      end
      V(i,j) = A(i,j)/V(j,j);
    end
  end

% prema substitucija

  for i = 1:n
    for j = 1:(i-1)
      b(i) = b(i) - V(i, j) * y(j);
    end
    y(i) = b(i) / V(i,i);
  end
  
  U = transpose(V);
  
 % obratna substitucija
  
  for i = n:-1:1
    for j = (i+1):n
      y(i) = y(i) - U(i, j) * x(j);
    end
    x(i) = y(i) / U(i, i);
  end
  
  
  
     
  
 
