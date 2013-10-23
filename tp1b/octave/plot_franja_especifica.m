function plot_franja_especifica(city, franja)
	if(nargin != 2)
		printf("ERROR: la función recibe una ciudad y una franja como parámetros)\n")
	else
		matriz_ciudad = load_matrix(city, franja);
		vector_tiempos = [matriz_ciudad(:,1); matriz_ciudad(:,2); matriz_ciudad(:,3)];
    
		plot(vector_tiempos, 'x');;
		hold on;

		xlabel(mat2str(franja));
		ylabel('Roundtrip Time (ms)');
		title('Roundtrip Time en una franja especifica');
		legend(city);

		hold off;
	end
end