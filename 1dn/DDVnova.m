function razlika = DDVnova (sez)

m = length(sez);

posebej = 0;

for i = 1:m
	posebej = posebej + round((sez(i) * 1.095) * 100) / 100;
end

posebej

skupaj = round((sum(sez) * 1.095) * 100) / 100

razlika = round(abs(skupaj - posebej) * 100) / 100;

