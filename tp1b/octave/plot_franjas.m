%Este script realiza el grafico de los rtt de tr_python y tr_linux promediados en funcion de las franjas horarias y graficando como constantes a los rtt teoricos.

function plot_franjas

		%vector de franjas, eje x
		franjas = load('../results/franjas.txt');

		%matriz de promedios tr_linux
		M_tr_l = getMatTRLin();

		%matriz de promedios tr_python
		M_tr_p = getMatTRPy();

		%puntos rtt linux
		plot(franjas, M_tr_l(1,:), '@o1');
		hold on;
		plot(franjas, M_tr_l(2,:), '@x1');
		hold on;
		plot(franjas, M_tr_l(3,:), '@*1');
		hold on;
		
		%puntos rtt python
		plot(franjas, M_tr_p(1,:), '@o3');
		hold on;
		plot(franjas, M_tr_p(2,:), '@x3');
		hold on;
		plot(franjas, M_tr_p(3,:), '@*3');
		hold on;

		xlabel('Franjas horarias (hs)');
		ylabel('Roundtrip Time (ms)');
		title('RTT traceroute propio vs tr. linux a lo largo del dia');
		legend('RTT Berkeley Lx', 'RTT Oxford Lx', 'RTT Tokio Lx', 'RTT Berkeley Py', 'RTT Oxford Py', 'RTT Tokio Py', "location", "southeast");
		legend("boxon");
		axis([-0.5 24]);
		hold off;
end
