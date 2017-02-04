neto =  randi([0 500], [1000 1])/100;

posebej = 0;

% funkcija round v Octavu nima precision parametra, zato najprej mnozim in nato delim s 100 v 8. vrstici
% v Matlabu bi na tem mestu napisal samo "round(neto(i) * 1.095, 2)"
for i = 1:1000
  posebej = posebej + round(neto(i) * 1.095 .* 100) ./ 100;
end

posebej

skupaj = ((sum(neto) * 1.095) .* 100)  ./ 100
abs(skupaj - posebej);
% ali je tu problem, ker odštevamo dve skoraj enaki števili?


pize = randi([400 600], [3 1])/100;
  

  