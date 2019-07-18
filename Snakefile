import pandas as pd

t = pd.read_csv("inputs/madagascar_metadata.csv")
SRA = t["run_accession"]

rule all:
    input: expand("outputs/abundtrim/{SRA_IDS}.abundtrim.fq.gz", SRA_IDS=SRA)

rule fastq_dump_abundtrim:
    output: "outputs/abundtrim/{SRA_ID}.abundtrim.fq.gz"
    params: SRA_ID="{SRA_ID}"
    conda: "env.yml"
    shell: """
        # set +o pipefail - explicitly tell snakemake to ignore the pipefail. 
        set +o pipefail
        fastq-dump -A {params.SRA_ID} -Z | trim-low-abund.py -C 3 -Z 18 -M 20e9 -V -k 31 - -o {output} --gzip 
    """
