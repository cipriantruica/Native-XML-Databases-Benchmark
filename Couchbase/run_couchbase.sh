#!/bin/bash

CBQ=/opt/couchbase/bin/cbq
USERNAME=$1
PASSWORD=$2
ENGINE=$3


for p in `seq 0 3`
do 
    db_idx=$((2 ** $p))
    db="dblpdb$db_idx"
    q_name=("q1_kw1" "q1_kw2" "q1_kw3" "q2_kw1a2" "q2_kw1a3" "q2_kw2a3" "q2_kw1o2" "q2_kw1o3" "q2_kw2o3" "q3_kw1a2a3" "q3_kw1o2o3" "count_docs_authors" "count_docs_authors_year" "count_docs_authors_year_kw1a2a3" "count_docs_authors_year_kw1o2o3")
    q_code=("\"SELECT title FROM $db WHERE title LIKE '%database%';\"" "\"SELECT title FROM $db WHERE title LIKE '%text%';\"" "\"SELECT title FROM $db WHERE title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%text%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%text%' AND title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%text%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%text%' OR title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%text%' AND title LIKE '%mining%';\"" "\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%text%' OR title LIKE '%mining%';\"" "\"SELECT a AS author, count(*) AS cnt FROM $db UNNEST author AS a GROUP BY a;\"" "\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a GROUP BY $db.year, a;\"" "\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a WHERE Dblpdb8.title LIKE '%database%' AND $db.title LIKE '%text%' AND $db.title LIKE '%mining%' GROUP BY $db.year, a;\"" "\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a WHERE $db.title LIKE '%database%' OR $db.title LIKE '%text%' OR $db.title LIKE '%mining%' GROUP BY $db.year, a;\"")
    for ((i = 0; i < ${#q_code[@]}; i++))
    do  
        query="${q_code[$i]}"
        out="out_"$db"_"${q_name[$i]}
        echo $out
        echo $query
        exec_cmd="echo "$query" | "$CBQ" -u "$USERNAME" -p "$PASSWORD" -engine="$ENGINE" >> "$out
        echo $exec_cmd
        for j in `seq 0 9`
        do
            eval $exec_cmd
        done
    done
done


# q1_kw1="\"SELECT title FROM $db WHERE title LIKE '%database%';\""
# q1_kw2="\"SELECT title FROM $db WHERE title LIKE '%text%';\""
# q1_kw3="\"SELECT title FROM $db WHERE title LIKE '%mining%';\""
# q2_kw1a2="\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%text%';\""
# q2_kw1a3="\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%mining%';\""
# q2_kw2a3="\"SELECT title FROM $db WHERE title LIKE '%text%' AND title LIKE '%mining%';\""
# q2_kw1o2="\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%text%';\""
# q2_kw1o3="\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%mining%';\""
# q2_kw2o3="\"SELECT title FROM $db WHERE title LIKE '%text%' OR title LIKE '%mining%';\""
# q3_kw1a2a3="\"SELECT title FROM $db WHERE title LIKE '%database%' AND title LIKE '%text%' AND title LIKE '%mining%';\""
# q3_kw1o2o3="\"SELECT title FROM $db WHERE title LIKE '%database%' OR title LIKE '%text%' OR title LIKE '%mining%';\""
# count_docs_authors="\"SELECT a AS author, count(*) AS cnt FROM $db UNNEST author AS a GROUP BY a;\""
# count_docs_authors_year="\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a GROUP BY $db.year, a;\""
# count_docs_authors_year_kw1a2a3="\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a WHERE $db.title LIKE '%database%' AND $db.title LIKE '%text%' AND $db.title LIKE '%mining%' GROUP BY $db.year, a;\""
# count_docs_authors_year_kw1o2o3="\"SELECT $db.year, a AS author, count(*) AS cnt FROM $db UNNEST author AS a WHERE $db.title LIKE '%database%' OR $db.title LIKE '%text%' OR $db.title LIKE '%mining%' GROUP BY $db.year, a;\""
# echo $q1_kw1
# echo $q1_kw2
# echo $q1_kw3
# echo $q2_kw1a2
# echo $q2_kw1a3
# echo $q2_kw2a3
# echo $q2_kw1o2
# echo $q2_kw1o3
# echo $q2_kw2o3
# echo $q3_kw1a2a3
# echo $q3_kw1o2o3
# echo $count_docs_authors
# echo $count_docs_authors_year
# echo $count_docs_authors_year_kw1a2a3
# echo $count_docs_authors_year_kw1o2o3 