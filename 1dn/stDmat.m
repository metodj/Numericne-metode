function stevec = stDmat(n)
  
  A = mat(n);
  stevec = 0;
  
  for i = 1:n
    for j = 1:n
      stevec = stevec + stD(A(i,j));
    end
  end
  
