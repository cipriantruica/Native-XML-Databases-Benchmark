#!/bin/bash

RPATH="./results/corpus_"
SEDNACLIENT="/data/sedna/bin/se_term"
DBNAME=dblpdb
QPATH="./queries/*"

for ((j=3; j>=0; j-=1))
do
    n=$(python -c "print(2**${j})")
    for query in $QPATH
    do
        echo $query
        filename=$(basename "$query")
        filename="${filename%.*}"
        echo $filename
        for i in `seq 1 10`
        do
            echo "Query "$filename" experiment "$i" database "$n
            start=`date +%s.%N`
            $SEDNACLIENT -file $query $DBNAME$n > $RPATH$n"/output_"$filename"_"$i
            end=`date +%s.%N`
            runtime=$(python -c "print(${end} - ${start})")
            printf $runtime", " >> $RPATH$n"/runtime_"$filename
        done;
    done;
done;
