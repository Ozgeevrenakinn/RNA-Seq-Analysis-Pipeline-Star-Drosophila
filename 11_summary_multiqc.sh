O
#!/bin/bash
#summary dosyalarini alarak multiqc raporu olusturma
multiqc counts/ -n featurecounts_report -f --filename pattern='*.summary'

