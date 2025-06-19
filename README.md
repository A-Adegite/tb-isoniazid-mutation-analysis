# Searching for Mutations Leading to Isoniazid Resistance in *Mycobacterium tuberculosis*

This project explores the genomic mutations associated with Isoniazid (INH) resistance  in *Mycobacterium tuberculosis* using next-generation sequencing (NGS) data. The workflow includes data acquisition, quality control, read preprocessing, read mapping, variant calling, and mutation analysis.

---

## 📁 Project Structure
```
.
├── README.md                      # Project overview and usage instructions
├── data/                         # Input data (not uploaded)
│   ├── raw_reads/               # Raw FASTQ files
│   ├── repaired_reads/          # Fixed/validated reads
│   ├── trimmed_reads/           # Cleaned reads after adapter/quality trimming
│   └── reference/               # Reference genome and index files
│
├── mapping/                      # Read alignment outputs
│   ├── bam_sorted/              # Sorted BAM files
│   ├── bam_dedup/               # Deduplicated BAM files
│   └── bam_stats/               # Mapping and alignment statistics
│
├── qc_reports/                   # FastQC reports for quality control
│   ├── raw_reads/
│   └── trimmed_reads/
│
├── scripts/                      # Bash scripts for each pipeline step
│   ├── download_data.sh
│   ├── qc_raw_reads.sh
│   ├── trim_reads.sh
│   ├── qc_trimmed_reads.sh
│   ├── map_reads.sh
│   ├── sort_dedup.sh
│   ├── variant_calling.sh
│   └── ...
│
├── variant_calls/                # VCF and BCF files from variant calling
│
└── results/                      # Summary tables, plots, or mutation annotations
```
