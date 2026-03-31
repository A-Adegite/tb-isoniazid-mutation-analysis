#!/usr/bin/env bash

set -euo pipefail

# Directory containing the trimmed paired-end FASTQ files
input_path="../data/raw_reads/"

# Directory where TB-Profiler results will be saved
output_path="../tbprofiler_results/"

# Number of threads
threads=8

mkdir -p "${output_path}"

# Loop over all forward read files ending with _1.fastq.gz
for file in "${input_path}"*_1.fastq.gz
do
    # Extract the sample name by removing the directory path and the suffix _1.fastq.gz
    sample=$(basename "$file" _1.fastq.gz)
    echo "Processing ${sample}..."

    # Run TB-Profiler on paired-end FASTQ
    tb-profiler profile \
        -1 "${input_path}${sample}_1.fastq.gz" \
        -2 "${input_path}${sample}_2.fastq.gz" \
        -p "${sample}" \
        -t ${threads} \
        --dir "${output_path}" \
        --txt --csv

    echo "Completed ${sample}"
done

# Collate individual tb-profiler sample result
tb-profiler collate \
    --dir "${output_path}results" \
    --prefix "${output_path}results/collated_output/collated"

echo "All Samples Processed"
