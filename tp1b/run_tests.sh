#! /bin/bash

clear

url=$1
times=$2
counter=0

while [  $counter -lt $times ]; do
	echo "Corriendo traceroute numero $((counter + 1)). Bancá un toque."
	sudo traceroute -I $url | tail -n 1 >> ./tests/tests.txt
	let counter=counter+1
done

clear
echo "El archivo con la informacion de traceroute está en:"
echo `pwd`"/tests/tests.txt"
echo ""
echo "Corré \"ruby get_time.rb\" para crear la matriz cuando tengas informacion suficiente."