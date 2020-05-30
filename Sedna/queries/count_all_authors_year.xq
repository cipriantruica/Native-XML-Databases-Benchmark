let $coll := doc("dblp")
let $db := $coll/dblp
for $author in distinct-values($db//author), $year in distinct-values($db//year)
let $count := count($db/*[author = $author and year = $year])
order by $count descending
    return <group author="{data($author)}" year="{data($year)}">{$count}</group>