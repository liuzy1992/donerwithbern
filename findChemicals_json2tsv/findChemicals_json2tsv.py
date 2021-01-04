#!/usr/bin/env python3

import sys
import os
if len(sys.argv) == 1 or sys.argv[1] in ['-h', '--help']:
    with open(os.path.splitext(sys.argv[0])[0]+'_help.txt', 'r') as h:
        print(h.read())
    sys.exit(0)

import json

def json2tsv(infile):
    with open(infile, 'r') as f:
        jsonList = json.loads(f.read().strip())
    text = jsonList[0]['text']
    PMID = jsonList[0]['sourceid']
    for e in jsonList[0]['denotations']:
        if e['obj'] == 'drug':
            eName = text[e['span']['begin']:e['span']['end']]
            print(PMID, end='\t')
            print('|'.join(e['id']), end='\t')
            print(eName.lower(), end='\t')
            print(str(e['span']['begin']), end='\t')
            print(str(e['span']['end']), end='\n')

json2tsv(sys.argv[1])
