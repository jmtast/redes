function plot_franjas(city, franja0, franja2, franja8, franja11, franja15, franja22)

	if(nargin != 7)
		printf("ERROR: aridad plot_franjas(ciudad, franja0, franja2, franja8, franja11, franja15, franja22)\n")
	else
		franjas = [0, 2, 8, 11, 15, 22];
		promedios = [franja0, franja2, franja8, franja11, franja15, franja22];
		plot(franjas, promedios, 'x');
		hold on;

		xlabel('Franjas horarias');
		ylabel('Roundtrip Time (ms)');
		title('Roundtrip Time a lo largo del dia');
		legend(city);

		hold off;
	end
end