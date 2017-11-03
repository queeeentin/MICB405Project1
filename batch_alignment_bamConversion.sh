#!/bin/bash

if [ $# -ne 6 ]
then
	echo "Usage $0 <input directory> <output directory> <ref.fa> <read_R1.fq> <read_R2.fq> <output prefix>"
	exit 2
fi 



indir=$1
outdir=$2
ref_fasta=$3
R1=$4
R2=$5
output=$6

bwaOutput=$output.sam
sambambaOutput=$output.bam

#Align reads to reference
bwa mem $ref_fasta $indir/$R1 $indir/$R2 > $outdir/$bwaOutput

#Convert bam to sam
sambamba view -S --format=bam -o $sambambaOutput $outdir/$bwaOutput
