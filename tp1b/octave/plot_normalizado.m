function plot_normalizado
	rtts = getMatTRLin;
	franjas = franjas_normalizadas;

	plot(franjas(1,:), rtts(1,:), "@1");
	hold on;

	plot(franjas(2,:), rtts(2,:), "o2");

	plot(franjas(3,:), rtts(3,:), "*3");

	xlabel('Hora del dia');
	ylabel('Roundtrip Time (ms)');
	title('Roundtrip Time global en una jornada de 24hs');
	legend('Universidad de Berkeley', 'Universidad de Oxford', 'Universidad de Tokio');

	hold off;
end