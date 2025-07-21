#!/bin/bash
# '#' ile baslayan satirlari atla sayim ve gene_id al
awk 'BEGIN{FS="\t"; OFS=","} 
    !/^#/ {
        if(header_printed == 0) {
            printf "%s", $1
            for(i=7; i<=NF; i++) {
                match($i, /(GSM[0-9]+)/, m)
                if(m[1] != "") printf ",%s", m[1]
            }
            print ""
            header_printed=1
            next
        }
        printf "%s", $1
        for(i=7; i<=NF; i++) printf ",%s", $i
        print ""
    }
' counts/all_samples.counts.txt > counts/gene_counts_simple.csv





