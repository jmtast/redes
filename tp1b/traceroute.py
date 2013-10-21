#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys

from icmping import icmping

def traceroute(iface, ipdst, limit=64):
    done = False
    answers = []
    ttl = 1

    while ttl <= limit and not done:
        (answer, rtt) = icmping(iface, ipdst, ttl)

        if answer:
            if answer.type == 0: # echo-reply
                ip = answer.src
                done = True
            elif answer.type == 11: # time-exceeded
                ip = answer.src
            else:
                ip = "(*)"
        else:
            ip = "(**)"

        ttl = ttl + 1
        answers.append((ip, rtt))

    return answers

def main():

    if len(sys.argv) != 4:
        print "Error: faltan parametros. Uso: traceroute.py interfaz ip limit."
        exit(1)

    ipdst = sys.argv[2]
    answers = traceroute(sys.argv[1], ipdst, int(sys.argv[3]))

    for (ip, rtt) in answers:
        print "El host %s respondio en %d ms." % (ip, rtt * 1000)

if __name__ == '__main__':
    main()

