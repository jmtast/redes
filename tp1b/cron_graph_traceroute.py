#!/usr/bin/env python
# -*- coding: iso-8859-1 -*-

import sys
import time

from graph_traceroute import graph_traceroute

if len(sys.argv) < 3:
    print "Error: faltan parametros. Uso: cron_graph_traceroute.py archivoEntrada directorioSalida."
    exit(1)

outputDir = sys.argv[2]
with open(sys.argv[1]) as f:
    lines = f.readlines()

hour = time.strftime("%H")

for line in lines:
    line = line.replace("\n", "")
    (university, dns, ip) = line.split("\t")

    graph_traceroute(dns, "%s/%s_%s.pdf" % (outputDir, university, hour))
