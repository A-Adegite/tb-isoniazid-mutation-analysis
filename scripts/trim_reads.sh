#!/usr/bin/env bash

# Directory containing the raw paired-end FASTQ files
input_path="../data/raw_reads/"

# Directory where the trimmed FASTQ files will be saved
output_path="../data/trimmed_reads/"

# Loop over all forward read files ending with _1.fastq.gz in input_path
for file in "${input_path}"*_1.fastq.gz
do
    # Extract the sample name by removing the directory path and the suffix _1.fastq.gz
    sample=$(basename "$file" _1.fastq.gz)
    echo "Processing ${sample}..."

     # Run fastp to perform quality trimming and filtering on paired-end reads
    fastp \
    -i "${input_path}${sample}_1.fastq.gz" \
    -I "${input_path}${sample}_2.fastq.gz" \
    -o "${output_path}${sample}_1.fastq.gz" \
    -O "${output_path}${sample}_2.fastq.gz" \
    --html "${output_path}${sample}_fastp.html" \
    --json "${output_path}${sample}_fastp.json"

    echo "Completed ${sample}"
done

echo "All Samples Processed"
