SampleIndex = {"dim","kem","rus"}
ref = "cah.onlychr.fa"
rule all:
    input:
        expand("{sample}/sv-lengths.png", sample = SampleIndex)
rule align:
    input:
        "{sample}.onlychr.fa"
    output:
        "{sample}.sam"
    shell:
        "minimap2 -a -x asm5 --cs -r2k -t 5 {ref} {input} > {output}"
rule samtools:
    input:
        "{sample}.sam"
    output:
        "{sample}.sorted.bam"
    shell:
        """
        samtools sort -m4G -@4 -o {output} {input}
        samtools index {output}
        """
rule svim:
    input:
        "{sample}.sorted.bam"
    output:
        "{sample}/sv-lengths.png"
    params:
        "{sample}"
    shell:
        "svim-asm haploid {params} {input} {ref}"
