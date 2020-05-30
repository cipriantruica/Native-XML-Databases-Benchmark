SELECT `dblpdb8`.year, a AS author, count(*) AS cnt
FROM `dblpdb8` 
UNNEST author AS a 
WHERE 
	`dblpdb8`.title LIKE '%database%'
	AND `dblpdb8`.title LIKE '%text%'
	AND `dblpdb8`.title LIKE '%mining%'
GROUP BY `dblpdb8`.year, a;

SELECT `dblpdb4`.year, a AS author, count(*) AS cnt
FROM `dblpdb4` 
UNNEST author AS a 
WHERE 
	`dblpdb4`.title LIKE '%database%'
	AND `dblpdb4`.title LIKE '%text%'
	AND `dblpdb4`.title LIKE '%mining%'
GROUP BY `dblpdb4`.year, a;

SELECT `dblpdb2`.year, a AS author, count(*) AS cnt
FROM `dblpdb2` 
UNNEST author AS a 
WHERE 
	`dblpdb2`.title LIKE '%database%'
	AND `dblpdb2`.title LIKE '%text%'
	AND `dblpdb2`.title LIKE '%mining%'
GROUP BY `dblpdb2`.year, a;

SELECT `dblpdb1`.year, a AS author, count(*) AS cnt
FROM `dblpdb1` 
UNNEST author AS a 
WHERE 
	`dblpdb1`.title LIKE '%database%'
	AND `dblpdb1`.title LIKE '%text%'
	AND `dblpdb1`.title LIKE '%mining%'
GROUP BY `dblpdb1`.year, a;