#!/usr/bin/env bash

# Directory containing the trimmed paired-end FASTQ files
input_path="../data/trimmed_reads/"

# Directory where the reapired FASTQ files will be saved
output_path="../data/repaired_reads/"

# Loop over all forward read files ending with _1.fastq.gz in input_path
for file in "${input_path}"*_1.fastq.gz
do
    # Extract the sample name by removing the directory path and the suffix _1.fastq.gz
    sample=$(basename "$file" _1.fastq.gz)
    echo "Repairing ${sample}..."
    
    # Repair disordered reads
    repair.sh \
        in1="${input_path}/${sample}_1.fastq.gz" \
        in2="${input_path}/${sample}_2.fastq.gz" \
        out1="${output_path}/${sample}_1.fastq.gz" \
        out2="${output_path}/${sample}_2.fastq.gz" \
        outs="${output_path}/${sample}_single.fq" \
        repair
    
    echo "Completed ${sample}"
done

echo "All Samples Processed"