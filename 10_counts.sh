#!/bin/bash
# featureCounts komutu ile coklu BAM dosyasindan gen sayimi al
#!/bin/bash

# 8 işlemci çekirdeği kullan (paralel işlem)
# Veriler unstranded (0); strand-specific için 1 veya 2
# Paired-end veriler için -p
# Özellik tipi: exon
# Gen gruplama: gene_id
# Kalite filtresi: MAPQ >= 10
# Anotasyon dosyası: GTF formatında
# Çıktı dosyası: Tüm örnekler için tek tablo
# Girdi: Tüm BAM dosyaları (STAR hizalamasından çıkan)

featureCounts \
  -T 8 \
  -s 0 \
  -p \
  -t exon \
  -g gene_id \
  -Q 10 \
  -a data/ref/dm6.gtf \
  -o counts/all_samples.counts.txt \
  mapped/*Aligned.sortedByCoord.out.bam

