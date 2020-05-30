let $coll := doc("dblp")
let $db := $coll/dblp
for $author in distinct-values($db//author)
let $count := count($db/*[author = $author])
order by $count descending
return <group author="{data($author)}">{$count}</group>
