function plot_franjas(matriz)

	if(nargin != 1)
		printf("ERROR: la función recibe una matriz como parámetro)\n")
	else
		franjas = [0, 2, 8, 11, 15, 22];
		plot(franjas, matriz(1,:), 'x');
		hold on;

		plot(franjas, matriz(2,:), 'o');
		plot(franjas, matriz(3,:), '+');

		xlabel('Franjas horarias');
		ylabel('Roundtrip Time (ms)');
		title('Roundtrip Time a lo largo del dia');
		legend('Berkeley', 'Oxford', 'Tokio');

		hold off;
	end
end