#!/usr/bin/env bash

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
echo "Indexing reference genome: ${ref_genome}"
bwa-mem2 index "${ref_genome}"

for file in "${input_path}"*_1.fastq.gz
do
    # Extract the sample name by removing the directory path and the suffix _1.fastq.gz
    sample=$(basename "$file" _1.fastq.gz)
    echo "Mapping sample: ${sample}"

    # Run bwa-mem2 mem to map paired reads to the reference genome and save sam file
    bwa-mem2 mem "${ref_genome}" \
        "${input_path}/${sample}_1.fastq.gz" "${input_path}/${sample}_2.fastq.gz" > "${output_path}${sample}.sam"

    # Convert sam file to bam file
    samtools view -Sb "${output_path}${sample}.sam" > "${output_path}${sample}.bam"

    echo "Completed mapping for ${sample}"
done

echo "All samples processed"
