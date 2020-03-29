xquery version "3.1";

let $coll := collection(/db/dblpdb4)
let $db := $coll/dblp
let $kw3 := 'mining'
let $q1_kw3 := $db//title[contains(lower-case(.), $kw3)]
return $q1_kw3
