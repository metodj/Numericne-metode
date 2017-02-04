function i = stD(n)

i = 0;

for k = 1:n
	if rem(n, k) == 0
		i = i + 1;
	end
end




