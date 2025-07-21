#!/bin/bash
#STAR icin referans genom ve anotasyon dosyalarindan bir dizin (index) olusturulur.
#nano 05_generate_index.sh 
mkdir data/index
STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir data/index \
--genomeFastaFiles data/ref/dm6.fa \
--sjdbGTFfile data/ref/dm6.gtf \
--genomeSAindexNbases 12


