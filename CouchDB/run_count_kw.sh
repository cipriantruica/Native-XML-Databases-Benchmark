#!/bin/bash

RPATH="./results/corpus_"
DBHOST=$1
DBPORT=$2
DBNAME=$3

for ((j=3; j>=0; j-=1))
do
    n=$(python -c "print(2**${j})")
    URL1="http://"$DBHOST":"$DBPORT"/"$DBNAME$n"/_design/count_all_authors_year_kw1o2o3/_view/count_all_authors_year_kw1o2o3?group=true&descending=true"
    for i in `seq 1 10`
    do    
        start=`date +%s.%N`    
        curl $URL1 > $RPATH$n"/output_count_all_authors_year_kw1o2o3_"$i
        end=`date +%s.%N`
        runtime=$(python -c "print(${end} - ${start})")
        printf $runtime", " >> $RPATH$n"/runtime_count_all_authors_year_kw1o2o3"
    done;

    URL2="http://"$DBHOST":"$DBPORT"/"$DBNAME$n"/_design/count_all_authors_year_kw1a2a3/_view/count_all_authors_year_kw1a2a3?group=true&descending=true"
    for i in `seq 1 10`
    do    
        start=`date +%s.%N`    
        curl $URL2 > $RPATH$n"/output_count_all_authors_year_kw1a2a3_"$i
        end=`date +%s.%N`
        runtime=$(python -c "print(${end} - ${start})")
        printf $runtime", " >> $RPATH$n"/runtime_count_all_authors_year_kw1a2a3"
    done;
done;
