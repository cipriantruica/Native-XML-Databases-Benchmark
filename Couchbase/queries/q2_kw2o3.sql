SELECT title FROM `dblpdb8` WHERE title LIKE '%text%' 
UNION
SELECT title FROM `dblpdb8` WHERE title LIKE '%mining%';

SELECT title FROM `dblpdb4` WHERE title LIKE '%text%' 
UNION
SELECT title FROM `dblpdb4` WHERE title LIKE '%mining%';

SELECT title FROM `dblpdb2` WHERE title LIKE '%text%' 
UNION
SELECT title FROM `dblpdb2` WHERE title LIKE '%mining%';

SELECT title FROM `dblpdb1` WHERE title LIKE '%text%' 
UNION
SELECT title FROM `dblpdb1` WHERE title LIKE '%mining%';