xquery version "3.1";

let $kw1 := 'database'
let $kw2 := 'text'
let $kw3 := 'mining'
let $coll := collection(/db/dblpdb1)
let $db := $coll/dblp
for $paper in $db/*, $author in  $paper/author
where $paper//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw2) and contains(lower-case(.), $kw3)]
group by $author, $year := $paper/year
let $count := count($paper)
order by $count descending
return <group author="{data($author)}" year="{data($year)}">{$count}</group>
