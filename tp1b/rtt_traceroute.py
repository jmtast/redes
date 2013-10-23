#!/usr/bin/env python

import sys
import os
from traceroute import traceroute
import datetime

if len(sys.argv) < 5:
  print "Error: faltan parametros. Uso: rtt_traceroute.py max_hops iteraciones archivoEntrada"
  exit(1)
        
max_hops = int(sys.argv[1])
it = int(sys.argv[2])
#levanto datos de destinos
with open(sys.argv[3]) as f:
 lines = f.readlines()

for line in lines:
 line = line.replace("\n", "")
 (dst, dns, ip) = line.split("\t")
 dtime = datetime.datetime.now().time()
 with os.fdopen(os.open('rtt' + dst + '_' + str(dtime.hour) + 'h_' + str(dtime.minute) + 'm.txt', os.O_WRONLY | os.O_CREAT, 0600), 'w') as handle:
 #fd = os.open('rtt' + dst + '_' + str(dtime.hour) + 'h_' + str(dtime.minute) + 'm.txt', os.O_RDWR, int("0600", 8))
 #fs = os.fdopen(fd, 'w')
  for i in range (0, it):
   answers = traceroute(dns, max_hops)
   rtt = answers[len(answers)-1][1]
   handle.write('%d\t%d\n' % (i,rtt*1000))
   #print('%d\t%d\n' % (i,rtt*1000))
  #fs.close()
