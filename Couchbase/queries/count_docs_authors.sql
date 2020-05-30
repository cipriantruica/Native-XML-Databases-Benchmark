SELECT a AS author, count(*) AS cnt
FROM `dblpdb8` 
UNNEST author AS a 
GROUP BY a;

SELECT a AS author, count(*) AS cnt
FROM `dblpdb4` 
UNNEST author AS a 
GROUP BY a;

SELECT a AS author, count(*) AS cnt
FROM `dblpdb2` 
UNNEST author AS a 
GROUP BY a;

SELECT a AS author, count(*) AS cnt
FROM `dblpdb1` 
UNNEST author AS a 
GROUP BY a;