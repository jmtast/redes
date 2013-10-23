function average = get_average(city, franja)
	if (nargin != 2)
    printf('%s\n', "ERROR: La funcion recibe una ciudad y una franja como parámetro")
    return
  end

  matrix = load_matrix(city, franja);

  column_mean = mean(matrix);
  average = (column_mean(1) + column_mean(2) + column_mean(3))/3;

end
