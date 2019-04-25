###Bam to fastq
samtools bam2fq -N -1 DSDEX43_1.fastq.gz -2 DSDEX43_2.fastq.gz DSDEX43.sorted.rmdup.bam

###Indexing Reference genome using samtools
samtools faidx  /data/Suro/Sus_Scrofa/HumanPig/HS_Pig.fa
###Indexing reference genome using STAR
STAR  --runMode genomeGenerate --runThreadN 12 --genomeDir /data/Suro/Sus_Scrofa/HumanPig --genomeFastaFiles /data/Suro/Sus_Scrofa/HumanPig/HS_Pig.fa --sjdbGTFfile /data/Suro/Sus_Scrofa/HumanPig/HS_Pig.gtf
###Indexing reference genome using RSEM
rsem-prepare-reference --gtf /data/Suro/Sus_Scrofa/HumanPig/HS_Pig.gtf /data/Suro/Sus_Scrofa/HumanPig/HS_Pig.fa /data/Suro/Sus_Scrofa/HumanPig/SS11_HG38
