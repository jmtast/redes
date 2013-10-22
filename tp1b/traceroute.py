#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys
import socket
from icmping import icmping
from scapy.all import *

def traceroute(ipdst, limit=64):
    done = False
    answers = []
    ttl = 1
    socket.gethostbyaddr(ipdst)
    print'traceroute a \'%s\'' % socket.gethostbyaddr(ipdst)[2][0]
    while ttl <= limit and not done:
        ip = IP(dst=ipdst, ttl=ttl)  # Armo paquete IP
        icmp = ICMP()  # Armo un paquete ICMP, por defecto su operacion es echo-request
        
        initTime = time.time()
        answer = sr1(ip / icmp, timeout=5, verbose=0)
        rtt = time.time() - initTime

        if answer:
            if answer.type == 0: # echo-reply
                ip = answer.src
                done = True
            elif answer.type == 11: # time-exceeded
                ip = answer.src
            else:
                ip = "(*)"
            print "%d  El host %s respondio en %d ms." % (ttl, ip, rtt * 1000)
        else:
            ip = None
            print "%d  Sin respuesta" % (ttl)

        ttl = ttl + 1
        answers.append((ip, rtt))

    return answers

def main():

    if len(sys.argv) < 3:
        print "Error: faltan parametros. Uso: traceroute.py ip limit."
        exit(1)

    ipdst = sys.argv[1]
    traceroute(ipdst, int(sys.argv[2]))

if __name__ == '__main__':
    main()

