#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys

from icmping import icmping


def trans_atlantic_traceroute(iface, ipdst, limit=64):
    pass


def main():

    if len(sys.argv) != 4:
        print "Error: faltan parametros. Uso: traceroute.py interfaz ip limit."
        exit(1)

    ipdst = sys.argv[2]
    trans_atlantic_nodes = trans_atlantic_traceroute(sys.argv[1], ipdst, int(sys.argv[3]))

    for (ip, rtt) in trans_atlantic_nodes:
        print "Presencia de host transatlántico %s respondiendo en %d ms." % (ip, rtt * 1000)

if __name__ == '__main__':
    main()
