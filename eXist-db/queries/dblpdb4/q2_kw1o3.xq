xquery version "3.1";

let $coll := collection(/db/dblpdb4)
let $db := $coll/dblp
let $kw1 := 'database'
let $kw3 := 'mining'
let $q2_kw1o3 := $db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw3)]
return $q2_kw1o3
