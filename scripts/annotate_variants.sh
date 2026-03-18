#!/usr/bin/env bash

set -euo pipefail

# Path to the directory containing filtered snps and indels (VCFs)
snps_path="../variant_calls/snps/"
indels_path="../variant_calls/indels/"

# SnpEff database for Mycobacterium tuberculosis H37Rv
snpeff_db="Mycobacterium_tuberculosis_h37rv"

# Path to Annotated variants
snps_output_path="../annotation/snps"
indels_output_path="../annotation/indels"

# Stats subfolders
snps_stats_path="${snps_output_path}/stats"
indels_stats_path="${indels_output_path}/stats"

# Path to reference genome
ref_genome="../data/reference/mycobacterium_tuberculosis.fna"

# Make sure all output directories exist
mkdir -p "${indels_output_path}" "${snps_output_path}" "${snps_stats_path}" "${indels_stats_path}"

# Annotate SNPs
for file in "${snps_path}"*.vcf
do
    sample=$(basename "${file}" .vcf)
    echo "Processing SNPs for ${sample}"

    # Define stats HTML path
    stats_html="${snps_stats_path}/${sample}_snpEff_summary.html"
    stats_txt="${snps_stats_path}/${sample}_snpEff_genes.txt"

    # Normalize variants (split multiallelic sites)
    bcftools norm -m- -f "${ref_genome}" "${file}" | \
    sed 's/^NC_000962.3/Chromosome/' | \

    # Annotate with snpeff
    java -jar ~/snpEff/snpEff.jar "${snpeff_db}" \
        -stats "${stats_html}" \
        -csvStats "${stats_txt}" \
        - | bgzip -c > "${snps_output_path}/${sample}_annotated.vcf.gz"

    # Index the compressed annotated VCF
    tabix -p vcf "${snps_output_path}/${sample}_annotated.vcf.gz"
done

echo "Annotation complete for SNPs"

# Annotate Indels
for file in "${indels_path}"*.vcf
do
    sample=$(basename "${file}" .vcf)
    echo "Processing INDELs for ${sample}"

    # Define stats HTML path
    stats_html="${indels_stats_path}/${sample}_snpEff_summary.html"
    stats_txt="${indels_stats_path}/${sample}_snpEff_genes.txt"

    # Normalize variants (split multiallelic sites)
    bcftools norm -m- -f "${ref_genome}" "${file}" | \
    sed 's/^NC_000962.3/Chromosome/' | \

    # Annotate with snpeff
    java -jar ~/snpEff/snpEff.jar "${snpeff_db}" \
        -stats "${stats_html}" \
        -csvStats "${stats_txt}" \
        - | bgzip -c > "${indels_output_path}/${sample}_annotated.vcf.gz"

    # Index the compressed annotated VCF
    tabix -p vcf "${indels_output_path}/${sample}_annotated.vcf.gz"
done

echo "Annotation complete for INDELs"
