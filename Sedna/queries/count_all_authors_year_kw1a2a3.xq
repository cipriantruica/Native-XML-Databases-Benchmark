let $kw1 := 'database'
let $kw2 := 'text'
let $kw3 := 'mining'
let $coll := doc("dblp")
let $db := $coll/dblp
for $author in distinct-values($db//author), $year in distinct-values($db//year)
where $paper//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw2) and contains(lower-case(.), $kw3)]
let $count := count($db/*[author = $author and year = $year and contains(lower-case(title), $kw1) and contains(lower-case(title), $kw2) and contains(lower-case(title), $kw3)])
order by $count descending
    return <group author="{data($author)}" year="{data($year)}">{$count}</group>