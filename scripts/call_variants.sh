#!user/bin/env bash

set -euo pipefail

# Path to the directory containing sorted deduplicated bam files
input_path="../mapping/bam_dedup/"

# Path to store variant call files (VCF)
output_path="../variant_calls/raw/"

# Path to reference genome
ref_genome="../data/reference/mycobacterium_tuberculosis.fna"

# Make directory if it doesn't exist
mkdir -p "${output_path}"

# Index reference genome using samtools and creates fasta index
samtools faidx "${ref_genome}"

for file in "${input_path}"*_dedup.bam
do
    sample=$(basename "${file}" _dedup.bam)
    echo "Calling variants on sample: ${sample}"

    # call variants
    bcftools \
        mpileup -f "${ref_genome}" "${file}"  | \
        bcftools call --ploidy 1 -m -v -Oz -o"${output_path}${sample}.vcf.gz" 
    
    # index variant calls
    tabix -p vcf "${output_path}${sample}.vcf.gz"

done
echo "Variant Calling Complete"
