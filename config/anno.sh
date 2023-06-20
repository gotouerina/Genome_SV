perl -alne 'if ($F[2] eq "gene") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[3] - 1; $end = $F[4] - 1; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.genes.srt.bed.gz
perl -alne 'if ($F[2] eq "gene") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[4] - 1; $end = $start + 20001; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.genes.downstream.bed.gz
perl -alne 'if ($F[2] eq "gene") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[3] - 20001; $end = $F[3]; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.genes.upstream.bed.gz
perl -alne 'if ($F[2] eq "exon") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[3] - 1; $end = $F[4] - 1; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.exons.srt.bed.gz
perl -alne 'if ($F[2] eq "mRNA") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[3] - 1; $end = $F[3]; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.cds_start.srt.bed.gz
perl -alne 'if ($F[2] eq "mRNA") {$F[8] =~ /ID=(.*?);/; $name = $1; $start = $F[4] - 1; $end = $F[4]; print "$F[0]\t$start\t$end\t$name";}' $gff | sort -k1,1 -k2,2n -k3,3n | bgzip -c > sample.cds_end.srt.bed.gz
#tabix *.gz
