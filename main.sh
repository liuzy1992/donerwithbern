#!/usr/bin/env bash

path=`dirname $(realpath "$BASH_SOURCE")`

# get JSON format NER results from BERN API
mkdir BERNresults_json
cd BERNresults_json
cat ../"$1" | parallel -j "$2" "$path"/getBERNresults/getBERNresults.sh
cd ..

# find chemical entities and convert JSON files to TSV files
ls BERNresults_json/* |parallel -j "$2" "$path"/findChemicals_json2tsv/findChemicals_json2tsv.py
