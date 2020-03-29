#!/bin/bash

RPATH="./results/corpus_"
QPATH="./queries/*"
DBHOST=$1
DBPORT=$2
DBNAME=$3

echo $DBHOST
echo $DBPORT
echo $DBNAME

for j in `seq 0 3`
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
            start=`date +%s.%N`    
            URL="http://"$DBHOST":"$DBPORT"/"$DBNAME$n"/_find"
            curl $URL -d @$query -H 'Content-Type:application/json' > $RPATH$n"/output_"$filename"_"$i
            end=`date +%s.%N`
            runtime=$(python -c "print(${end} - ${start})")
            printf $runtime", " >> $RPATH$n"/runtime_"$filename
        done;
    done;
done;
