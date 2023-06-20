#! /bin/bash
$ref = ref.fasta
$qry = qry.fasta
##比对
nucmer --maxmatch -c 500 -b 500 -l 100 --prefix=$ref.$qry $ref $qry
##过滤
delta-filter -m -i 90 -l 100 $ref.$qry.delta > $ref.$qry.filter
##二进制转文本文件
show-coords -THrd $ref.$qry.filter > $ref.$qry.coords
##syri 
syri -c $ref.$qry.coords -d $ref.$qry.filter -r $ref -q $qry --prefix $ref.$qry
