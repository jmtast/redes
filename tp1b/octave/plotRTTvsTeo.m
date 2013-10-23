function plotRTTvsTeo(nroCiudad)

	%vector de franjas, eje x
	franjas = load('../results/franjas.txt');
	franjas2 = franjas;
	franjas(end + 1) = 24;
	
	if(nroCiudad == 1)
		city = 'Berkeley)';
	else 
		if (nroCiudad == 2)
			city = 'Oxford)';
		else
			city = 'Tokyo)';
		end
	end

	%matriz de promedios tr_linux
	M_tr_l = getMatTRLin();

	tr_l = M_tr_l(nroCiudad,:);

	%matriz de promedios tr_python
	M_tr_p = getMatTRPy();

	tr_p = M_tr_p(nroCiudad,:);

	teos = load('../results/rtt_teoricos.txt');
	rtt_teo = teos(nroCiudad);
	
	t = [];
	for i = 1:length(franjas)
		t = [t rtt_teo];
	end

	max_y = max([tr_p tr_l]) + 10;

	plot(franjas, t, "-1");
	hold on;

	plot(franjas2, tr_l, '@^3');
	hold on;

	plot(franjas2, tr_p, '@*0');
	hold on;

	xlabel('Franjas horarias (hs)');
	ylabel('RTT (ms)');
	tit = strcat('RTT empirico vs. RTT teorico (',city);
	title(tit);
	legend('RTT teorico', 'RTT emp Lx', 'RTT emp Py', "location", "southwest");
	legend("boxon");
	axis([-0.5 24 0 max_y]);
	hold off;

	


end
