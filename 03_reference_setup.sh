#!/bin/bash
#referans dosyalarinin indirilmesi ve ref klasorune tasinmasi
wget https://zenodo.org/record/6457007/files/Drosophila_melanogaster.BDGP6.32.109_UCSC.gtf.gz -O dm6.gtf.gz
wget https://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/dm6.fa.gz 
gunzip dm6.gtf.gz
gunzip dm6.fa.gz
mv dm6.gtf dm6.fa data/ref/
