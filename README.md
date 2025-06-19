# Searching for Mutations Leading to Isoniazid Resistance in *Mycobacterium tuberculosis*

This project explores the genomic mutations associated with Isoniazid (INH) resistance  in *Mycobacterium tuberculosis* using next-generation sequencing (NGS) data. The workflow includes data acquisition, quality control, read preprocessing, read mapping, variant calling, and mutation analysis.

---

## 🗂️ Project Structure
```
.
├── README.md                    # Project overview and usage instructions
├── environment.yml              # Conda environment file 
├── data/                        # Input data (not uploaded)
│   ├── raw_reads/               # Raw FASTQ files
│   ├── repaired_reads/          # Fixed/validated reads
│   ├── trimmed_reads/           # Cleaned reads after adapter/quality trimming
│   └── reference/               # Reference genome and index files
│
├── mapping/                     # Read alignment outputs
│   ├── bam_sorted/              # Sorted BAM files
│   ├── bam_dedup/               # Deduplicated BAM files
│   └── bam_stats/               # Mapping and alignment statistics
│
├── qc_reports/                  # FastQC reports for quality control
│   ├── raw_reads/
│   └── trimmed_reads/
│
├── scripts/                     # Bash scripts for each pipeline step
│   ├── download_raw_reads.sh
│   ├── trim_reads.sh
│   ├── repair_reads.sh
│   ├── map_reads.sh  
│   ├── sort_dedup.sh
│   ├── variant_call.sh
│   └── ...
│
├── variant_calls/               # VCF and BCF files from variant calling
│
└── results/                     # Summary tables, plots, or mutation annotations
```


---

## 🔧 Pipeline Overview

The pipeline processes paired-end FASTQ files to identify variants associated with INH resistance in *M. tuberculosis*:

1. **Data Acquisition**
2. **Quality Control**
3. **Read Trimming**
4. **Read Mapping**
5. **Sorting & Deduplication**
6. **Variant Calling**
7. **Mutation Analysis**

---

## 🛠️ Tools & Dependencies

- Bash (Workflow scripting and automation)
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [MultiQC](https://multiqc.info/)  
- [BWA](https://github.com/bwa-mem2/bwa-mem2)
- [Samtools](http://www.htslib.org/)
- [BCFtools](http://www.htslib.org/doc/bcftools.html)

---

## 📦 Environment Setup

This project uses a Conda environment

### 1. Create the Conda environment:

```bash
conda env create -f environment.yml
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

# Step 5: Map reads to reference genome using BWA-MEM2
bash scripts/map_reads.sh

# Step 6: Sort and deduplicate BAM files using Samtools
bash scripts/sort_dedup.sh

# Step 7: Call variants using BCFtools
bash scripts/variant_calling.sh
```

> ⚠️ Ensure that all required tools are installed and accessible in your system's `$PATH`.

---

## 📦 Data Access

Due to GitHub file size restrictions, input FASTQ files, reference genome files, and intermediate outputs are **not included** in this repository.

To obtain the required data:

- Run `scripts/download_data.sh` which fetches all required files from public repositories, or  
- Manually download them using the accession numbers or URLs referenced inside the script

---

## 📚 Acknowledgment

This project was completed as part of the **Foundations in NGS: Genomics** training program by [HackBio](https://thehackbio.com/).

