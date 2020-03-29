#!/bin/bash

RPATH="./results/SingleNode/corpus_"
QPATH="./queries2/*"
MONGODBCLIENT=mongo
DBHOST=$1
DBPORT=$2
DBNAME=$3

for j in `seq 0 3`
do
    n=$(python -c "print(2**${j})")
    for query in $QPATH
    do
        # echo $query
        filename=$(basename "$query")
        # echo $filename
        for i in `seq 1 10`
        do    
            echo "Query "$filename" experiment "$i
            start=`date +%s.%N`    
            $MONGODBCLIENT $DBHOST:$DBPORT/$DBNAME$n < $query > $RPATH$n"/output_"$filename"_"$i
            end=`date +%s.%N`
            runtime=$(python -c "print(${end} - ${start})")
            printf $runtime", " >> $RPATH$n"/runtime_"$filename
        done;
    done;
done;
