#!/usr/bin/env bash

set -euo pipefail

# Path to the directory containing raw vcf files
input_path="../variant_calls/raw/"

# Base folder
base_vcf_path="../variant_calls/"

# Path to filtered VCF files
filtered_vcf_path="${base_vcf_path}filtered/"

# Paths for separated variants and stats
indel_path="${base_vcf_path}indels/"
snps_path="${base_vcf_path}snps/"
stats_path="${base_vcf_path}stats/"

# Make sure all output directories exist
mkdir -p "${filtered_vcf_path}" "${indel_path}" "${snps_path}" "${stats_path}"

for file in "${input_path}"*vcf.gz
do
    sample=$(basename "${file}" .vcf.gz)
    echo "Filtering variants: ${sample}"

    # Filter variants
    bcftools filter \
        -s LOWQUAL \
        -e "DP < 10 || QUAL < 30 || MQ < 30" \
        "${file}" \
        -Oz \
        -o "${filtered_vcf_path}${sample}_filtered.vcf.gz"

    # Index filtered VCFs
    tabix -p vcf "${filtered_vcf_path}${sample}_filtered.vcf.gz"

    # View statistics on filtered VCFs
    bcftools stats "${filtered_vcf_path}${sample}_filtered.vcf.gz" >  "${stats_path}${sample}_stats.txt"

    # Keep only variants that pass
    bcftools view -f PASS "${filtered_vcf_path}${sample}_filtered.vcf.gz" \
        -o "${filtered_vcf_path}${sample}_filtered_pass.vcf.gz"

    # Keep SNPs only
    bcftools view -v snps "${filtered_vcf_path}${sample}_filtered_pass.vcf.gz" \
        -o "${snps_path}${sample}_snps.vcf"

    # Keep Indels only
    bcftools view -v indels "${filtered_vcf_path}${sample}_filtered_pass.vcf.gz" \
        -o "${indel_path}${sample}_indels.vcf"
    
done 

echo "Variant Filtration Complete"
