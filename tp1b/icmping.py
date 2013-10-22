#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-


import sys
import time

from scapy.all import *


def icmping(dst, ttl=64):
    ip = IP(dst=dst, ttl=ttl)  # Armo paquete IP
    icmp = ICMP()  # Armo un paquete ICMP, por defecto su operacion es echo-request

    initTime = time.time()
    answer = sr1(ip / icmp, timeout=5, verbose=0)

    return (answer, time.time() - initTime)


def main():

    if len(sys.argv) < 2:
        print "Error: faltan parametros. Uso: icmping.py ip [ttl]."
        exit(1)

    dst = sys.argv[1]

    if len(sys.argv) >= 4:
        (answer, rtt) = icmping(dst, int(sys.argv[2]))
    else:
        (answer, rtt) = icmping(dst)

    if answer:
        print "El host %s ha respondido en %f s:" % (dst, rtt)
        answer.show()
    else:
        print "El host %s no responde..." % dst


if __name__ == '__main__':
    main()
    
