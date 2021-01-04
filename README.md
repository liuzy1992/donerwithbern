# doNERwithBERN

**doNERwithBERN** is a tool to get chemical entitiy information of PubMed texts (title & abstract) using BERN API. 

---

## Usage
```shell
./main.sh <PMID_list> <num_jobs> > <output>
```
**PMID_list**: a one-column TSV file with a PMID in each row.
**num_jobs**: max number of files processed at the same time.

## Example
```shell
./main.sh test_data/testPMIDs.tsv 4 > tcmChemical2PMID.tsv
```

