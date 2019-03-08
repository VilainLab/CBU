---
layout: page
title: Pipelines
menu: header
---

## **RNA Seq**

FastQ files containing the raw RNA-Seq reads output from the sequencers are first checked for quality using FastQC. 

It is followed by trimming of poor quality reads using any of the following tools
•	Trimmomatic 
•	BBDuk
•	cutadapt

An aligner is used to align the reads to the reference genome (Human/Mouse etc) using any of the following tools
•	Tophat2
•	Hisat2
•	STAR

The aligned Sequence Alignment Map (SAM) files are sorted and converted to BAM using samtools in some cases

Next, the Binary Alignment Map (BAM) files are checked for their quality using either of the following tools
•	Picard RNASeqmetrics
•	RSeQC
In cases for fusion gene detection, we specifically use either the Tophat-fusion or STAR-Fusion tool. While splicing events are identified using SGSe tool part of the biocondutor package in R.

Quantification of reads to Transcripts per million (TPM) is calculated using RSEM.

For cases of high sequence duplication, we tag the duplicates using Picard MarkDuplicates and count the duplicated reads using featureCounts. In many cases of overduplication we also remove the duplicated reads using Picard MarkDuplicates.

For raw unnormalized counts, we use either of the following tools:
•	Htseq Counts
•	featureCounts


For Differential Gene expression, we use either the following packages in R:
•	Deseq2
•	EdgeR
•	Ebseq2

The final data can be represented in the form of heatmaps, volcano plots, MA plots and PCA plots using basic R packages. 


## **WGS/Exome Seq**

The raw sequencing data in fastqc files is first quality checked with FastQC and depending upon the quality it is trimmed using the following tools.
•	Trimmomatic 
•	BBDUK
•	cutadapt

An aligner is used to align the reads to the reference genome (Human/Mouse etc) using any of the following tools
•	Bwa-mem
•	Bowtie2

The aligned Sequence Alignment Map (SAM) files are processed  to Binary Alignment Map (BAM) files, 
•	samtools  
•	Picard tools

We follow the Genome Analysis Toolkit 4 (GATK 4),  pipeline to do Variant Calloing. The BAM files are further processed for using Base Quality Score Recalibration (BQSR) step to detect and correct base calling errors from sequencers:
•	BaseRecalibrator
•	ApplyBQSR

Variant calling is performed on the aligned BAM files, producing genome variant call format (gvcf) files using HaplotypeCaller function.

The gvcfs are combined using CombineGVCFs function, followed by running the GenotypeGVCFs function, to increase the sensitivity of the variants called. Output of this step is a vcf file,

The vcf file is then further processed  using Variant Quality Score Recalibration (VQSR) tools to increase the quality of variants identified, i.e. decrease the number of false positives. 

•	VariantRecalibrator 
•	ApplyVQSR 

Annotation of variant is done using Annovar, followed by manual filtration.


## **T-cell Receptor Sequencing**

The raw sequencing data in fastqc files is first quality checked with FastQC and depending upon the quality it is trimmed using the following tools.
•	Trimmomatic 
•	BBDuk
•	cutadapt

Extraction and alignment of fragments of target molecules is performed followed by assembly of overlapping fragmented sequencing reads into long-enough CDR3 containing contigs using the MiXCR pipeline to analyze TCR or Ig repertoire from sequencing data sequencing data.

4.	Metagenomics/Microbiome
The raw sequencing data in fastqc files is first quality checked with FastQC and depending upon the quality it is trimmed using the following tools.
•	Trimmomatic 
•	BBDuk
•	cutadapt

We perform demultiplexing and quality filtering, OTU picking, taxonomic assignment, and phylogenetic reconstruction, and diversity analyses and visualizations using QIIME1 pipeline.
