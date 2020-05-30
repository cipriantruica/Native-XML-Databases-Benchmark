SELECT `dblpdb8`.year, a AS author, count(*) AS cnt
FROM `dblpdb8` 
UNNEST author AS a 
GROUP BY `dblpdb8`.year, a;

SELECT `dblpdb4`.year, a AS author, count(*) AS cnt
FROM `dblpdb4` 
UNNEST author AS a 
GROUP BY `dblpdb4`.year, a;

SELECT `dblpdb2`.year, a AS author, count(*) AS cnt
FROM `dblpdb2` 
UNNEST author AS a 
GROUP BY `dblpdb2`.year, a;

SELECT `dblpdb1`.year, a AS author, count(*) AS cnt
FROM `dblpdb1` 
UNNEST author AS a 
GROUP BY `dblpdb1`.year, a;


