%Este script genera la matriz de promedios de cada ciudad para las franjas configuradas

function M_tr_l = getMatTRLin
	%Cargamos las franjas horarias
	v_fr = load('../results/franjas.txt');

	%Berkeley
	v_tr_l = zeros(1,length(v_fr));
	for i = 1:length(v_fr)
		v_tr_l(i) = get_average('california', v_fr(i)); 
	end

	M_tr_l = [v_tr_l];

	%Oxford
	for i = 1:length(v_fr)
		v_tr_l(i) = get_average('oxford', v_fr(i)); 
	end

	M_tr_l = [M_tr_l; v_tr_l];

	%Tokio
	for i = 1:length(v_fr)
		v_tr_l(i) = get_average('tokyo', v_fr(i)); 
	end

	M_tr_l = [M_tr_l; v_tr_l];
end


