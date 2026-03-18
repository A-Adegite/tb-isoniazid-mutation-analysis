#!/usr/bin/env python3

import pandas as pd
import re

# Input workbooks
snps_input_excel = "../annotation/snps/all_samples_annotations.xlsx"
indels_input_excel = "../annotation/indels/all_samples_annotations.xlsx"

# Output workbooks
snps_output_excel = "../annotation/snps/all_samples_drug_resistance.xlsx"
indels_output_excel = "../annotation/indels/all_samples_drug_resistance.xlsx"

# Drug resistance genes regex
drug_genes_pattern = re.compile(r"katG|inhA|ahpC|ndh|kasA", re.IGNORECASE)

def filter_drug_resistance(input_excel, output_excel):
    xls = pd.ExcelFile(input_excel)
    with pd.ExcelWriter(output_excel, engine='openpyxl') as writer:
        for sheet_name in xls.sheet_names:
            df = pd.read_excel(xls, sheet_name=sheet_name)
            df_filtered = df[df['Gene'].str.contains(drug_genes_pattern, na=False)]
            if not df_filtered.empty:
                df_filtered.to_excel(writer, sheet_name=sheet_name, index=False)
    print(f"Filtered workbook saved to {output_excel}")

# Filter SNPs and INDELs
filter_drug_resistance(snps_input_excel, snps_output_excel)
filter_drug_resistance(indels_input_excel, indels_output_excel)