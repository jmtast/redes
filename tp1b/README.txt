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

=================================
Sobre rtt_traceroute.py

- Precisa tener python instalado
- El archivo hostsDestinoInput debe tener una línea por host con los siguientes datos tabulados: nombre, dns, ip (ver ejemplo universidades.txt)

Utilización:
Ejecutar en la consola:
	sudo python rtt_traceroute interfaz max_hops iteraciones archivoHostsDestinoInput

Este script levantará los hosts destino del archivo especificado, y para cada uno correrá #iteraciones del traceroute implementado a través de scapy. Por cada set de corridas de cada host creará un output con nro. de it y RTT de cada corrida.
