let $coll := doc("dblp")
let $db := $coll/dblp
let $kw2 := 'text'
let $q1_kw2 := $db//title[contains(lower-case(.), $kw2)]
return $q1_kw2
