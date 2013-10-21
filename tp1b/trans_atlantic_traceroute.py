#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys
import math

from traceroute import traceroute


def desvio_standar(*args):
    N = len(args)
    prom = sum(args) / N
    return math.sqrt((sum([(x - prom) ** 2 for x in args])) / (N - 1))


def trans_atlantic_traceroute(iface, ipdst, limit=64, m=2):
    answers = traceroute(iface, ipdst, limit)
    n = len(answers)
    trans_atlantic_nodes = []
    for i, hop in enumerate(answers):
        if i < (n-1):
            j = i + 1
            next_hop = answers[j]
            rtt1, rtt2 = hop[1], next_hop[1]
            R = (rtt1 + rtt2) / 2  # promedio los rtt consecutivos
            d = desvio_standar(rtt1, rtt2)
            r = rtt1 + rtt2
            if r > R + m * d:
                trans_atlantic_nodes.append(next_hop)
        else:
            break
    return trans_atlantic_nodes


def main():
    if len(sys.argv) != 5:
        print "Error: faltan parametros. Uso: traceroute.py interfaz ip limit m"
        exit(1)

    ipdst = sys.argv[2]
    m = sys.argv[4]
    trans_atlantic_nodes = trans_atlantic_traceroute(sys.argv[1], ipdst, int(sys.argv[3]), int(m))

    for (ip, rtt) in trans_atlantic_nodes:
        print "Presencia de host transatlántico %s respondiendo en %d ms." % (ip, rtt * 1000)

if __name__ == '__main__':
    main()
