function t = mnk (C, N)

dol = size(N);

A_lin = zeros(dol(1), 2);
for i = 1:(dol(1))
    A_lin(i, 1) = C(i);
    A_lin(i, 2) = 1;
end

koef_lin = linsolve(transpose(A_lin)*A_lin, transpose(A_lin)*N)

A_exp = zeros(dol(1), 2);
for i = 1:(dol(1))
    A_exp(i, 1) = exp(C(i));
    A_exp(i, 2) = 1;
end

koef_exp = linsolve (transpose(A_exp)*A_exp, transpose(A_exp)*N)

vsota_lin = 0;
vsota_exp = 0;
for i = 1:(dol(1))
    vsota_lin = vsota_lin + (N(i) - koef_lin(1)*C(i) - koef_lin(2))^2;
    vsota_exp = vsota_exp + (N(i) - koef_lin(1)*exp(C(i)) - koef_lin(2))^2;
end

vsota_lin
vsota_exp    

t = 1;



 


