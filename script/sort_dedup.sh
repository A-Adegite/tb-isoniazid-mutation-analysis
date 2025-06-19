#!/usr/bin/env bash

# Path to the directory containing input BAM files
input_path="../mapping/"

# Path to store sorted BAM files
sorted_path="../mapping/bam_sorted/"

# Path to store deduplicated BAM files
dedup_path="../mapping/bam_dedup/"

# Path to store stats reports
stats_path="../mapping/bam_stats/"

# Create necessary directories if they don't exist
mkdir -p "${sorted_path}" "${dedup_path}" "${stats_path}"

for file in "${input_path}"*.bam
do 
    # Extract the sample name
    sample=$(basename "${file}" .bam)

    echo "Processing sample: ${sample}"

    # Check if BAM is paired-end by counting reads with paired flag
    paired_count=$(samtools view -c -f 1 "${file}")
    
    if [ "$paired_count" -gt 0 ]; then
        echo "${sample}: Paired-end data detected"

        # Step 1: Name sort for fixmate
        name_sorted_bam="${sorted_path}/${sample}_namesorted.bam"
        samtools sort -n "${file}" -o "${name_sorted_bam}"

        # Step 2: Fixmate to add mate tags
        fixmate_bam="${sorted_path}/${sample}_fixmate.bam"
        samtools fixmate -m "${name_sorted_bam}" "${fixmate_bam}"

        # Step 3: Coordinate sort after fixmate
        coord_sorted_bam="${sorted_path}/${sample}_sorted.bam"
        samtools sort "${fixmate_bam}" -o "${coord_sorted_bam}"
        echo "${sample}: Sorted with fixmate"

        # Step 4: Mark duplicates
        dedup_bam="${dedup_path}/${sample}_dedup.bam"
        samtools markdup -r "${coord_sorted_bam}" "${dedup_bam}"
        echo "${sample}: Duplicates removed"

    else
        echo "${sample}: Single-end data detected"

        # For single-end data: just sort and mark duplicates without fixmate
        coord_sorted_bam="${sorted_path}/${sample}_sorted.bam"
        samtools sort "${file}" -o "${coord_sorted_bam}"
        echo "${sample}: Sorted"

        # Mark duplicates on single-end BAM
        dedup_bam="${dedup_path}/${sample}_dedup.bam"
        samtools markdup -r "${coord_sorted_bam}" "${dedup_bam}"
        echo "${sample}: Duplicates removed"
    fi

    # Index the deduplicated BAM file
    samtools index "${dedup_bam}"

    # Generate flagstat reports before and after deduplication
    samtools flagstat "${coord_sorted_bam}" > "${stats_path}/${sample}_before_dedup.txt"
    samtools flagstat "${dedup_bam}" > "${stats_path}/${sample}_after_dedup.txt"

    echo "${sample}: Stats generated"
done

echo "All samples processed!"

