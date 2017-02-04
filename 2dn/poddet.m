function d = poddet(A)
  
  n = size(A)(1);
  
  d = zeros(n, 1);
  
  for i = 1:n
    d(i) = det(A(1:i,1:i));
  end
  
  