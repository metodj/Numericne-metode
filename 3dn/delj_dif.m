function d = delj_dif (X, Y)
  d = Y;
  n = length(X) - 1;
  for j=1:n
    for i=n:-1:j
      d(i+1)=(d(i+1)-d(i))/(X(i+1)-X(i-j+1));
    end
  end

  

