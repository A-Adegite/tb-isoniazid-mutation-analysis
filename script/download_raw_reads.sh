#!/usr/bin/env bash
output_path="../data/raw_reads/"
mkdir -p "$output_path"

curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774512/ERR8774512_1.fastq.gz -o ${output_path}/ERR8774512_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774512/ERR8774512_2.fastq.gz -o ${output_path}/ERR8774512_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/000/ERR8774480/ERR8774480_1.fastq.gz -o ${output_path}/ERR8774480_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/000/ERR8774480/ERR8774480_2.fastq.gz -o ${output_path}/ERR8774480_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774524/ERR8774524_1.fastq.gz -o ${output_path}/ERR8774524_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774524/ERR8774524_2.fastq.gz -o ${output_path}/ERR8774524_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774464/ERR8774464_1.fastq.gz -o ${output_path}/ERR8774464_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774464/ERR8774464_2.fastq.gz -o ${output_path}/ERR8774464_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/008/ERR8774458/ERR8774458_1.fastq.gz -o ${output_path}/ERR8774458_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/008/ERR8774458/ERR8774458_2.fastq.gz -o ${output_path}/ERR8774458_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774482/ERR8774482_1.fastq.gz -o ${output_path}/ERR8774482_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774482/ERR8774482_2.fastq.gz -o ${output_path}/ERR8774482_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/007/ERR8774487/ERR8774487_1.fastq.gz -o ${output_path}/ERR8774487_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/007/ERR8774487/ERR8774487_2.fastq.gz -o ${output_path}/ERR8774487_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774514/ERR8774514_1.fastq.gz -o ${output_path}/ERR8774514_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774514/ERR8774514_2.fastq.gz -o ${output_path}/ERR8774514_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774522/ERR8774522_1.fastq.gz -o ${output_path}/ERR8774522_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/002/ERR8774522/ERR8774522_2.fastq.gz -o ${output_path}/ERR8774522_2.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774534/ERR8774534_1.fastq.gz -o ${output_path}/ERR8774534_1.fastq.gz
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR877/004/ERR8774534/ERR8774534_2.fastq.gz -o ${output_path}/ERR8774534_2.fastq.gz