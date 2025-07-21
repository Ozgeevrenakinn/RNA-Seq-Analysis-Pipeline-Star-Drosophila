#!/bin/bash
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --show channels
conda create -n mapping fastqc multiqc star samtools subread igv
conda activate mapping


#terminale geri don sirasiyla CTRL+O, ENTER, CTRL+X
#Scripti terminalde calistirmak icin;
#chmod +x 01_setup.sh scripti calistirabilir yapar
#./01_setup.sh #scripti calistirir
