let $coll := doc("dblp")
let $db := $coll/dblp
let $kw2 := 'text'
let $kw3 := 'mining'
let $q2_kw2a3 := $db//title[contains(lower-case(.), $kw2) and contains(lower-case(.), $kw3)]
return $q2_kw2a3
