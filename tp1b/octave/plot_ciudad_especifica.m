function plot_ciudad_especifica(city)
	if(nargin != 1)
		printf("ERROR: la función recibe una ciudad como parámetro)\n")
	else
    franjas = [0, 2, 8, 11, 15, 22];
    puntos = ['*', '+', 'o', 'x', '*', '.'];
    colores = ['r', 'g', 'b', 'm', 'k', 'r'];

    min_filas = 21;

    for i = 1:6
  		matriz_ciudad = load_matrix(city, franjas(i));
  		vector_tiempos = [matriz_ciudad(:,1); matriz_ciudad(:,2); matriz_ciudad(:,3)];

      if (min_filas > length(matriz_ciudad(:,1)))
        min_filas = length(matriz_ciudad(:,1));
      end
    end

    for i = 1:6
      marker = puntos(i);
      style = {"marker", marker, "color", colores(i)};

      matriz_ciudad = load_matrix(city, franjas(i));
      vector_tiempos = [matriz_ciudad(1:min_filas,1); matriz_ciudad(1:min_filas,2); matriz_ciudad(1:min_filas,3)];

  		plot(vector_tiempos, style{:}, " ");

      if (i == 1)
        hold on;
      end
    end

		xlabel('Muestras');
		ylabel('Roundtrip Time (ms)');
		title('Roundtrip Time en una ciudad especifica');
		legend('franja 00', 'franja 02', 'franja 08', 'franja 11', 'franja 15', 'franja 22');

		hold off;

	end
end