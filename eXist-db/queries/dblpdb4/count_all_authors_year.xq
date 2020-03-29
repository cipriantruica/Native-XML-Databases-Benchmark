xquery version "3.1";

let $coll := collection(/db/dblpdb4)
let $db := $coll/dblp
for $paper in $db/*, $author in  $paper/author
group by $author, $year := $paper/year
let $count := count($paper)
order by $count descending
return <group author="{data($author)}" year="{data($year)}">{$count}</group>
