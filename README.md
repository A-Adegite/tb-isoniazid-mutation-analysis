# A Genomic Pipeline for Identifying Isoniazid Resistance Mutations in *Mycobacterium tuberculosis*

This project explores the genomic mutations associated with Isoniazid (INH) resistance  in *Mycobacterium tuberculosis* using next-generation sequencing (NGS) data. The workflow includes data acquisition, quality control, read preprocessing, read mapping, variant calling, and mutation analysis.

## 📊 Key Findings 
- The most prevalent mutation identified was **katG c.944G>C (p.Ser315Thr)**, a well-characterized variant associated with **high-level isoniazid resistance**  
- Mutations in the **inhA promoter region** were linked to **low-level resistance**, supporting their role in reduced drug susceptibility  
- A mutation (**c.-809G>C**) of uncertain significance was detected, highlighting the presence of variants requiring further investigation  
- Strong concordance was observed between the WHO resistance catalogue and TBProfiler predictions, validating the reliability of the pipeline  
- Resistance in the dataset was predominantly driven by **katG mutations**, consistent with globally reported resistance patterns
  
## 📄 Full Report

A detailed report including methodology, variant statistics, and biological interpretation is available here: [Read the Full Report](results/INH_resistance_analysis_report.md)


## 🗂️ Project Structure
```
.
├── README.md                     # Project overview and usage instructions
├── .gitignore
│
├── data/                         # Input data (not versioned)
│   ├── raw_reads/                # Raw FASTQ files
│   ├── repaired_reads/           # Repaired/validated reads
│   ├── trimmed_reads/            # Quality and adapter-trimmed reads
│   └── reference/                # Reference genome and index files
│
├── qc_reports/                   # Quality control reports (FastQC/MultiQC)
│   ├── raw_reads/
│   │   └── multiqc_data/         # Aggregated QC metrics (raw reads)
│   └── trimmed_reads/
│       └── multiqc_data/         # Aggregated QC metrics (trimmed reads)
│
├── mapping/                      # Read alignment outputs
│   ├── bam_sorted/               # Sorted BAM files
│   ├── bam_dedup/                # Deduplicated BAM files
│   └── bam_stats/                # Alignment statistics
│
├── variant_calls/                # Variant calling outputs
│   ├── raw/                      # Raw variant calls (VCF/BCF)
│   ├── filtered/                 # Filtered high-confidence variants
│   ├── snps/                     # SNP-specific results
│   ├── indels/                   # Indel-specific results
│   └── stats/                    # Variant calling statistics
│
├── annotation/                   # Variant annotation results (SnpEff)
│   ├── snps/
│   │   └── stats/
│   │       └── multiqc_data/     # MultiQC reports for SNP annotation
│   └── indels/
│       └── stats/
│           └── multiqc_data/     # MultiQC reports for indel annotation
│
├── tbprofiler_results/           # TBProfiler outputs
│   └── results/                  
│       └── collated_output/      # Combined TBProfiler summary results
│
├── scripts/                      #Scripts for each pipeline step (bash/python)
│
└── results/                      # Final summaries, plots, reports
    ├── figures/                  # Plots and visualizations
    ├── tables/                   # Processed result tables
    ├── report.md                 # Final written report
    └── visualization.ipynb       # Notebook for plotting and analysis

```


## 🔧 Pipeline Overview

The pipeline processes paired-end FASTQ files to identify variants associated with INH resistance in *M. tuberculosis*:

1. **Data Acquisition**
2. **Quality Control**
3. **Read Trimming**
4. **Read Mapping**
5. **Sorting & Deduplication**
6. **Variant Calling**
7. **Variant Annotation**
8. **Mutation Analysis**

## 🛠️ Tools & Dependencies

- Bash (Workflow scripting and automation)
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [fastp](https://github.com/OpenGene/fastp/blob/master/README.md)
- [BBTools](https://archive.jgi.doe.gov/data-and-tools/software-tools/bbtools/)
- [MultiQC](https://multiqc.info/)  
- [BWA](https://github.com/bwa-mem2/bwa-mem2)
- [Samtools](http://www.htslib.org/)
- [BCFtools](http://www.htslib.org/doc/bcftools.html)
- [SnpEff](https://pcingola.github.io/SnpEff/)
- [Python](https://www.python.org/)
- [Pandas](https://pandas.pydata.org/)
- [Openpyxl](https://pypi.org/project/openpyxl/)
- [TBProfiler](https://github.com/jodyphelan/TBProfiler)

## 📦 Environment Setup

This project uses a Conda environment

### 1. Create the Conda environment:

```bash
conda create --name tb_genomics
```

### 2. Activate the environment:

```bash
conda activate tb_genomics
```

## 🚀 How to Run

### 1. Make scripts executable:

```bash
chmod a+x scripts/*.sh
```

### 2. Execute the pipeline step-by-step:

```bash
# Step 1: Download raw reads and reference genome
bash scripts/download_data.sh

# Step 2: Run FastQC on raw reads

# Step 3: Trim adapters and low-quality reads
bash scripts/trim_reads.sh

# Step 4: Run FastQC on trimmed reads

# Step 5: Repair disordered reads
bash scripts/repair_reads.sh

# Step 6: Map reads to reference genome using BWA-MEM2
bash scripts/map_reads.sh

# Step 7: Sort and deduplicate BAM files using Samtools
bash scripts/sort_dedup.sh

# Step 8: Call variants using BCFtools
bash scripts/variant_call.sh

# Step 9: Filter low-quality variants
bash scripts/filter_variants.sh

# Step 10: Annotate variants (SnpEff)
bash scripts/annotate_variants.sh

# Step 11: Extract annotation tables
python3 scripts/extract_snpeff_annotations.py

# Step 12: Drug resistance filtering (final interpretation)
python3 scripts/filter_drug_resistance.py

# Step 13: TBProfiler resistance analysis
bash scripts/tbprofiler.sh

```

> ⚠️ Ensure that all required tools are installed and accessible in your system's `$PATH`.

## 📦 Data Access

Due to GitHub file size restrictions, input FASTQ files and intermediate outputs are **not included** in this repository.

To obtain the required data:

- Run `scripts/download_data.sh` which fetches all required files from public repositories, or  
- Manually download them using the accession numbers or URLs referenced inside the script

## 📚 Acknowledgment

This project was completed as part of the **Foundations in NGS: Genomics** training program by [HackBio](https://thehackbio.com/).

