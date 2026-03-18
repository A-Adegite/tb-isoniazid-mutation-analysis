#!/usr/bin/env python3

import pandas as pd
import gzip
import os

# Paths to annotated VCFs
snps_input_path = "../annotation/snps/"
indels_input_path = "../annotation/indels/"

# Output Excel files
snps_output_excel = "../annotation/snps/all_samples_annotations.xlsx"
indels_output_excel = "../annotation/indels/all_samples_annotations.xlsx"

def parse_vcf_to_df(vcf_file, sample_name):
    """Parse annotated VCF.gz to DataFrame"""
    rows = []
    with gzip.open(vcf_file, 'rt') as f:
        for line in f:
            if line.startswith("#"):
                continue
            fields = line.strip().split("\t")
            chrom, pos, _, ref, alt, _, _, info = fields[:8]

            # Extract ANN field
            ann_matches = [x for x in info.split(";") if x.startswith("ANN=")]
            if not ann_matches:
                continue
            ann_field = ann_matches[0][4:]  # Remove 'ANN='
            annotations = ann_field.split(",")

            for ann in annotations:
                ann_parts = ann.split("|")
                effect = ann_parts[1] if len(ann_parts) > 1 else ""
                impact = ann_parts[2] if len(ann_parts) > 2 else ""
                gene = ann_parts[3] if len(ann_parts) > 3 else ""
                hgvs_p = ann_parts[10] if len(ann_parts) > 10 else ""
                rows.append([sample_name, chrom, pos, ref, alt, gene, effect, impact, hgvs_p])

    df = pd.DataFrame(rows, columns=["Sample", "Chrom", "Pos", "Ref", "Alt", "Gene", "Effect", "Impact", "HGVS_p"])
    return df

def process_vcfs_to_excel(input_path, output_excel):
    """Parse all VCFs in folder and write each sample as a sheet"""
    files = [f for f in os.listdir(input_path) if f.endswith("_annotated.vcf.gz")]
    with pd.ExcelWriter(output_excel, engine='openpyxl') as writer:
        for file in files:
            sample_name = file.replace("_annotated.vcf.gz", "")
            vcf_path = os.path.join(input_path, file)
            print(f"Processing {sample_name}...")
            df = parse_vcf_to_df(vcf_path, sample_name)
            df.to_excel(writer, sheet_name=sample_name, index=False)
    print(f"Saved workbook to {output_excel}")

# Process SNPs and INDELs
process_vcfs_to_excel(snps_input_path, snps_output_excel)
process_vcfs_to_excel(indels_input_path, indels_output_excel)