%Este script genera la matriz de rtts promedidaos calculados por traceroute de python

function M_tr_py = getMatTRPy

	%Cargamos las franjas horarias
	v_fr = load('../results/franjas.txt');

	%Armamos la fila de California
	v_tr_p = zeros(1,length(v_fr));

	for i = 1:length(v_fr)
		ciudad = '../results/rttCalifornia-';
		if(v_fr(i) < 10)
			ciudad = strcat(ciudad, "0");
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		else
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		end
		ciudad = strcat(ciudad, 'hs.txt');
		
		A = load(ciudad);
		rtts = A(:,2);
		avg = sum(rtts) / length(rtts);
		if(i == 4 || i == 5)
			avg = avg - 150; #suavizamos los rtt de estas franjas porque se midieron en una red local con excesivo trafico
		end
		v_tr_p(i) = avg;
	end

	M_tr_py = [v_tr_p];

	%Armamos la fila de Oxford
	for i = 1:length(v_fr)
		ciudad = '../results/rttOxford-';
		if(v_fr(i) < 10)
			ciudad = strcat(ciudad, "0");
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		else
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		end
		ciudad = strcat(ciudad, 'hs.txt');
		
		A = load(ciudad);
		rtts = A(:,2);
		avg = sum(rtts) / length(rtts);
		if(i == 4 || i == 5)
			avg = avg - 150; #suavizamos los rtt de estas franjas porque se midieron en una red local con excesivo trafico
		end
		v_tr_p(i) = avg;
	end

	M_tr_py = [M_tr_py; v_tr_p];

	for i = 1:length(v_fr)
		ciudad = '../results/rttTokyo-';
		if(v_fr(i) < 10)
			ciudad = strcat(ciudad, "0");
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		else
			ciudad = strcat(ciudad, mat2str(v_fr(i)));
		end
		ciudad = strcat(ciudad, 'hs.txt');
		
		A = load(ciudad);
		rtts = A(:,2);
		avg = sum(rtts) / length(rtts);
		if(i == 4 || i == 5)
			avg = avg - 150; #suavizamos los rtt de estas franjas porque se midieron en una red local con excesivo trafico
		end
		v_tr_p(i) = avg;
	end

	M_tr_py = [M_tr_py; v_tr_p];
end
