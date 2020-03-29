#!/bin/bash

RPATH="./results/corpus_"
EXISTDBCLIENT=/data/eXistdb/bin/client.sh
USERNAME=$1
PASSWORD=$2
DBNAME=dblpdb

for ((j=3; j>=0; j-=1))
do
    n=$(python -c "print(2**${j})")
    QPATH="./queries/"$DBNAME$n"/*"
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
            $EXISTDBCLIENT -u $USERNAME -p $PASSWORD -c "/db/"$DBNAME$n -F $query > $RPATH$n"/output_"$filename"_"$i
            end=`date +%s.%N`
            runtime=$(python -c "print(${end} - ${start})")
            printf $runtime", " >> $RPATH$n"/runtime_"$filename
        done;
    done;
done;
