#!/usr/bin/env bash

set -euo pipefail

# Path to the directory containing input FASTQ files (trimmed reads)
input_path="../data/repaired_reads/"

# Path to the directory where output files will be stored (mapping results)
output_path="../mapping/"

# Path to the directory containing reference genome files (for indexing)
mapping_dir="../data/reference/"

# Reference genome filename
ref_genome="${mapping_dir}mycobacterium_tuberculosis.fna"

# Make sure output directory exists
mkdir -p "${output_path}"

# Index the reference genome with bwa-mem2
bwa-mem2 index "${mapping_dir}"/mycobacterium_tuberculosis.fna

for file in "${input_path}"*_1.fastq.gz
do
    # Extract the base name (without _1.fastq.gz)
    sample=$(basename "${file}" "_1.fastq.gz")
    echo "Mapping sample: ${sample}"

     # Run bwa-mem2 mem to map paired reads to the reference genome and save sam file
     bwa-mem2 mem \
        -t 8 \
        "${ref_genome}" \
        "${input_path}/${sample}_1.fastq.gz" \
        "${input_path}/${sample}_2.fastq.gz" > \
        "${output_path}${sample}.sam" 

    # Convert sam file to bam file
    samtools view -b -o "${output_path}${sample}.bam" "${output_path}${sample}.sam" 

     echo "Completed mapping for ${sample}"
done

echo "All samples processed"

     

