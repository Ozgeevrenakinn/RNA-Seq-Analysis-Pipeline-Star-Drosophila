#!/bin/bash
#STAR ile RNA dizisini referans dizine esleyelim
# STAR ile birden fazla ornegin hizalanmasi
# FASTQ dosyalarinin bulundugu dizin
FASTQ_DIR="data/fastq"
INDEX_DIR="data/index"

# _1.fastqsanger dosyalarina gore dongu
for r1 in $FASTQ_DIR/*_1.fastqsanger; do
    # ikinci uc (pair) dosyasini bul (_1 yerine _2)
    r2=${r1/_1.fastqsanger/_2.fastqsanger}

    # Ornek ismini ayikla (dosya adindan)
    sample=$(basename "$r1" _1.fastqsanger)

    echo "STAR hizalamasi basliyor: $sample"

    # STAR hizalama komutu
    STAR --runThreadN 8 \
    --readFilesIn "$r1" "$r2" \
    --genomeDir $INDEX_DIR \
    --outSAMtype BAM SortedByCoordinate \
    --outFileNamePrefix "mapped/${sample}_"

    echo "Tamamlandi: $sample"
done
