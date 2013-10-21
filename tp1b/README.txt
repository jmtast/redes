README

=================================

Sobre run_tests.sh

- No mover de donde está ubicado. Usa paths relativos a dicha ubicación (tp1b). Genera un archivo (append) "tests.txt" en una carpeta llamada "tests"

- Utilización:
En la consola, pararse sobre el path tp1b y ejecutar:
		./run_tests.sh url repeticiones

(el script va a correr para la dirección "url" (puede ser ip, es el parámetro de traceroute) una cantidad "repeticiones" de veces y va a generar un archivo con el resultado, que es la última línea del output del traceroute del sistema operativo).

=================================

Sobre get_time.rb

- Precisa tener ruby instalado. Es suficiente con un "sudo apt-get install ruby1.9.3" en la consola.
- Precisa haber corrido previamente al menos una vez run_tests.sh (busca el archivo que este script genera en la carpeta results)

- Utilización:
Ejecutar en la consola el comando
		ruby get_time.rb

- Luego de procesar, genera un archivo llamado "results.txt" en una carpeta "results" que también genera.

OBSERVACIÓN IMPORTANTE: Hay que tener cuidado, porque si algún output de run_tests.sh dio *, se desfasa todo el output y el script no sirve para esa línea. Como forma de evitarlo, se me ocurrió que si la línea tiene más de 23 columnas, se ignora (3 dígitos, el punto, 3 dígitos y el espacio). Escucho sugerencias.

=================================