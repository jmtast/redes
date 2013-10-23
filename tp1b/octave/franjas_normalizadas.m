function matrix = franjas_normalizadas
	franjas = load('../results/franjas.txt');
	franja_berkeley = franjas - 4;
	for i = 1:6
		if (franja_berkeley(i) < 0)
			franja_berkeley(i) = franja_berkeley(i) + 24;
		end

		if (franja_berkeley(i) > 23)
			franja_berkeley(i) = franja_berkeley(i) - 24;
		end
	end

	franja_oxford = franjas + 4;
	for i = 1:6
		if (franja_oxford(i) < 0)
			franja_oxford(i) = franja_oxford(i) + 24;
		end

		if (franja_oxford(i) > 23)
			franja_oxford(i) = franja_oxford(i) - 24;
		end
	end

	franja_tokyo = franjas + 12;
	for i = 1:6
		if (franja_tokyo(i) < 0)
			franja_tokyo(i) = franja_tokyo(i) + 24;
		end

		if (franja_tokyo(i) > 23)
			franja_tokyo(i) = franja_tokyo(i) - 24;
		end
	end

	matrix = [franja_berkeley; franja_oxford; franja_tokyo];
end