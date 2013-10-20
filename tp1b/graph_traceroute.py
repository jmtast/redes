#!/usr/bin/env python

import sys

from scapy.all import *


def graph_traceroute(dst, outputPath):
    (ans, unans) = traceroute(dst)

    if ans:
        ans.graph(type="pdf", target="> " + outputPath)
        return True
    else:
        return False


def main():
    if len(sys.argv) < 2:
        print "Error: faltan parametros. Uso: graph_traceroute.py destino [archivoSalida]."
        exit(1)

    dst = sys.argv[1]

    if len(sys.argv) >= 3:
        outputPath = sys.argv[2]
    else:
        outputPath = dst.replace(".", "_") + ".pdf"

    if graph_traceroute(dst, outputPath):
        print "Listo."
    else:
        print "El destino no responde."

if __name__ == '__main__':
    main()
