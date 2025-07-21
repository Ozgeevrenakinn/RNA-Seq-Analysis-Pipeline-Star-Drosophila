RNA-Seq Analysis Pipeline-STAR
Bu proje, Drosophila melanogaster RNA-Seq verileri üzerinde kalite kontrol, hizalama, gen ifade sayımı ve özet raporlamayı içeren adım adım bir analiz süreci sunar. Scriptler modüler yapıdadır ve bash ortamında çalıştırılabilir.

Dosyalar:
https://training.galaxyproject.org/training-material/topics/transcriptomics/tutorials/ref-based/tutorial.html#tip-importing-via-links
1.
https://zenodo.org/record/6457007/files/GSM461177_1_subsampled.fastqsanger
https://zenodo.org/record/6457007/files/GSM461177_2_subsampled.fastqsanger
https://zenodo.org/record/6457007/files/GSM461180_1_subsampled.fastqsanger
https://zenodo.org/record/6457007/files/GSM461180_2_subsampled.fastqsanger
2.
https://zenodo.org/record/6457007/files/Drosophila_melanogaster.BDGP6.32.109_UCSC.gtf.gz

https://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/ 
https://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/genes/
3.
dm6.ensGene.gtf.gz 

>>İçerik
1. Conda ortamının kurulumu
2. FASTQ dosyalarının indirilmesi ve yeniden adlandırılması
3. Referans genom ve anotasyon dosyalarının hazırlanması
4. Kalite kontrol (FastQC & MultiQC)
5. STAR ile hizalama (tekli ve çoklu örnek)
6. Hizalama kalitesi değerlendirmesi
7. IGV ile görselleştirme
8. featureCounts ile ifade sayımı
9. MultiQC ile özet rapor oluşturma
10. Sonuçların CSV formatına dönüştürülmesi
11. Örnek grup bilgileri dosyasının hazırlanması

>>Çıktılar
1. bash 01_setup.sh
mapping/ klasörü; data/fastq/    data/ref/     data/index/

2. bash 02_fastq_multiqc.sh
data/fastq/ ;
GSM461177_1.fastqsanger GSM461177_2.fastqsanger GSM461180_1.fastqsanger GSM461180_2.fastqsanger

3. bash 03_reference_setup.sh
   data/ref/ ; dm6.fa (referans genom) dm6.gtf (anotasyon)
   
4. bash 04_fastqc_multiqc.sh
data/fastq/ ; *_fastqc.zip *_fastqc.html

multiqc_report.html

5. bash 05_generate_index.sh
data/index/ ; STAR tarafından oluşturulan birçok dosya (SA, SAindex, Genome, sjdb*, vs.)

6. bash 06_map_reads.sh
mapped/;

GSM461177Aligned.sortedByCoord.out.bam GSM461177Log.final.out GSM461177Log.out GSM461177Log.progress.out GSM461177SJ.out.tab (Diğer örnekler için de aynı şekilde)

7. bash 07_star_quality.sh
Uniquely mapped reads %     % of reads mapped to multiple loci       % of reads unmapped

8. bash 08_star_multiqc.sh
star_multiqc_report.html

9. bash 09_samtools_index.sh
mapped/ ;

*.bam.bai

10. bash 10_counts.sh
counts/ ;

GSM461177.counts    all_samples.counts.txt     all_samples.counts.txt.summary

11. bash 11_summary_multiqc.sh
featurecounts_report.html

12. bash 12_counts_order.sh
counts/gene_counts_simple.csv

13. bash 13_sample_info.sh
samples.csv


STAR hizalamasında --genomeSAindexNbases 12 değeri Drosophila için optimize edilmiştir. featureCounts parametresi -s 0 ile yonsuz (unstranded) olarak ayarlanmıştır. Strand-specific veri varsa -s 1 veya -s 2 kullanılmalıdır.
-s 0	Unstranded (yönsüz): Okumaların hangi DNA sarmalından geldiği bilinmiyor.
-s 1	Stranded (yönlü): Okumalar sense (orijinal) zincirden geliyor.
-s 2	Reversely stranded: Okumalar antisense (ters) zincirden geliyor.

IGV kullanımı için .bam ve .bam.bai dosyaları gerekir, ayrıca dm6.fa referans genomu yüklenmelidir.

Multiqc raporu
<img width="1200" height="800" alt="fastqc-status-check-heatmap" src="https://github.com/user-attachments/assets/aeb5099a-19e3-4270-b515-4e052f7789b0" />

Örneklerin per tile sequence quality raporu fail durumda, kırpma yapmadan önce hizalama yaptıktan sonra ki okumaları değerlendirdik.


<img width="1200" height="800" alt="star_alignment_plot" src="https://github.com/user-attachments/assets/1384d7ad-bd8c-4129-8d79-c6a16664db97" />

Okuma
Sample Name
Aligned  Uniq aligned
GSM461177	87.6% 82.2%
GSM461180	79.8% 75.6%

Bu sonuçlara göre, %70–80+ uniquely aligned oranları, genellikle yeterli kaliteyi ve biyolojik anlam taşımaya uygun veriyi gösterir. Bu sebeple trimming yapılmamıştır.


