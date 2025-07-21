#!/bin/bash
#Kalite kontrol(fastqc)
fastqc data/fastq/* #tum fastq orneklerinin kalite kontrolunu yapar

#multiqc raporunun olusturulmasi
multiqc data/fastq/*fastqc* #Tek raporda her fastq kalitesini gormek icin
