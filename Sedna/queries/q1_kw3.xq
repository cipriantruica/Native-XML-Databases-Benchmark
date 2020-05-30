let $coll := doc("dblp")
let $db := $coll/dblp
let $kw3 := 'mining'
let $q1_kw3 := $db//title[contains(lower-case(.), $kw3)]
return $q1_kw3
