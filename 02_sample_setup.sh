#!/bin/bash
#fastq dosyalarinin indirilmesi ve yeni isimleriyle kaydedilmesi

wget_commands=$(cat <<EOF
wget https://zenodo.org/record/6457007/files/GSM461177_1_subsampled.fastqsanger
wget https://zenodo.org/record/6457007/files/GSM461177_2_subsampled.fastqsanger
wget https://zenodo.org/record/6457007/files/GSM461180_1_subsampled.fastqsanger
wget https://zenodo.org/record/6457007/files/GSM461180_2_subsampled.fastqsanger
EOF
)

# Her bir satiri isle
while read -r line; do
  url=$(echo "$line" | awk '{print $2}')
  fname=$(basename "$url")  #GSM461177_1_subsampled.fastqsanger
  # "_subsampled" ifadesini cikar ve orijinal dosya ismini olustur
  clean_name=$(echo "$fname" | sed 's/_subsampled//g')
  wget -q "$url" -O "data/fastq/$clean_name"
done <<< "$wget_commands"
