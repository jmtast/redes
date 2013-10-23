#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys
import math

from traceroute import traceroute


def desvio_estandar(*args):
    N = len(args)
    prom = sum(args) / N
    return math.sqrt((sum([(x - prom) ** 2 for x in args])) / (N - 1))


def trans_atlantic_traceroute(ipdst, limit=64, m=2):
    answers = traceroute(ipdst, limit) #obtengo los resultados de la ruta
    n = len(answers)
    trans_atlantic_nodes = []
    acumRtt = 0 #aca se acumulan los rtts entre hops consecutivos
    for i, hop in enumerate(answers):
        if i < (n-1):
            j = i + 1
            next_hop = answers[j]
            rtt1, rtt2 = hop[1], next_hop[1]
            r = rtt2 - rtt1
            acumRtt += r #acumulo el rtt entre dos hops consecutivos
            R = acumRtt / (i+1) #promedio los i rtts de enlaces consecutivos que ya tuve
            d = desvio_estandar(rtt1, rtt2)
            if r > R + m * d: #si el rtt entre hops supera esta medida, se marcan
                trans_atlantic_nodes.append(hop)
                trans_atlantic_nodes.append(next_hop)
        else:
            break
    return trans_atlantic_nodes


def main():
    if len(sys.argv) < 4:
        print "Error: faltan parametros. Uso: traceroute.py ip limit m"
        exit(1)

    ipdst = sys.argv[1]
    m = sys.argv[3]
    trans_atlantic_nodes = trans_atlantic_traceroute(ipdst, int(sys.argv[2]), int(m))

    for (ip, rtt) in trans_atlantic_nodes:
        print "Presencia de host transatlántico %s respondiendo en %d ms." % (ip, rtt * 1000)

if __name__ == '__main__':
    main()
