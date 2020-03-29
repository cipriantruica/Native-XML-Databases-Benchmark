xquery version "3.1";

let $coll := collection(/db/dblpdb8)
let $db := $coll/dblp
for $paper in $db/*
  for $author in  $paper/author
  group by $author
    let $count := count($paper)
    order by $count descending
    return <group author="{data($author)}">{$count}</group>
