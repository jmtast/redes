function matrix = load_matrix(ciudad, franja)
  path = strcat("../results/", ciudad)
  if (franja == 0 || franja == 8)
    path = strcat(path, "-0")
  else
    path = strcat(path, "-")
  end
  path = strcat(path, mat2str(franja))
  path = strcat(path, "hs.txt")
  matrix = dlmread(path)
end