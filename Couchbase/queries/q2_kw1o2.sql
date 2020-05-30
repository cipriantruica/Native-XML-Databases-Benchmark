SELECT title FROM `dblpdb8` WHERE title LIKE '%database%' 
UNION
SELECT title FROM `dblpdb8` WHERE title LIKE '%text%';

SELECT title FROM `dblpdb4` WHERE title LIKE '%database%' 
UNION
SELECT title FROM `dblpdb4` WHERE title LIKE '%text%';

SELECT title FROM `dblpdb2` WHERE title LIKE '%database%' 
UNION
SELECT title FROM `dblpdb2` WHERE title LIKE '%text%';

SELECT title FROM `dblpdb1` WHERE title LIKE '%database%' 
UNION
SELECT title FROM `dblpdb1` WHERE title LIKE '%text%';