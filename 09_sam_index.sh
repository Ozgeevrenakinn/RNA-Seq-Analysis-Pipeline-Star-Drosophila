#!/bin/bash
#samtools ile olusturulan index dosyalari

for bam_file in mapped/*Aligned.sortedByCoord.out.bam; do
    echo "Indexing $bam_file"
    samtools index "$bam_file"
done

