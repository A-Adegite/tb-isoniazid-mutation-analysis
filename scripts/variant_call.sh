#!/usr/bin/env bash

# Path to the directory containing input deduplicated BAM files
input_path="../mapping/bam_dedup/"

# Path to the directory containing reference genome files
mapping_dir="../data/reference/"

# Reference genome filename
ref_genome="${mapping_dir}mycobacterium_tuberculosis.fna"

# Path to store output files (bcf and vcf)
output_path="../variant_calls/"

# Create necessary directory if it doesn't exist
mkdir -p "${output_path}"

# Loop over each deduplicated BAM file
for file in "${input_path}"*dedup.bam
do
    # Extract sample name by removing the directory path and suffix 'dedup.bam'
    sample=$(basename "${file}" _dedup.bam)
    
    echo "Processing sample: ${sample}"

    # Define output BCF and VCF file paths
    bcf_out="${output_path}${sample}.bcf"
    vcf_out="${output_path}${sample}.vcf"
    filtered_vcf_out="${output_path}${sample}.filtered.vcf"

    # Generate mpileup (BCF)
    bcftools mpileup -O b -o "${bcf_out}" -f "${ref_genome}" "${file}"

    # Call variants (SNVs)
    bcftools call --ploidy 1 -m -v -o "${vcf_out}" "${bcf_out}"

    # Filter variants
    vcfutils.pl varFilter "${vcf_out}" > "${filtered_vcf_out}"

    echo "Finished processing ${sample}. Filtered VCF saved to ${filtered_vcf_out}"
done
