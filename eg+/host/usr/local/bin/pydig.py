#!/usr/bin/env python
 
import dns.resolver, sys
hostname = sys.argv[1]
n=hostname
try:
  while True:
    for rdata in dns.resolver.query(n, 'CNAME') :
      print rdata
      n=rdata.target
except:
  for rdata in dns.resolver.query(n) :
    print rdata

