xquery version "3.1";

let $coll := collection(/db/dblpdb1)
let $db := $coll/dblp
let $kw1 := 'database'
let $kw3 := 'mining'
let $q2_kw1a3 := $db//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw3)]
return $q2_kw1a3
