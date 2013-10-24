function matrix = get_hops_column(city)
	path = strcat(city, "_hops.txt");
	path = strcat("../results/", path);
	matrix = load(path);
	transpuesta = matrix';
	transpuesta = mean(transpuesta);
	matrix = transpuesta';
end