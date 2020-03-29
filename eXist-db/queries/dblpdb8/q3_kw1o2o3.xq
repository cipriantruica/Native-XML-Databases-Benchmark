xquery version "3.1";

let $coll := collection(/db/dblpdb8)
let $db := $coll/dblp
let $kw1 := 'database'
let $kw2 := 'text'
let $kw3 := 'mining'
let $q3_kw1o2o3 := $db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw2)  or contains(lower-case(.), $kw3)]
return $q3_kw1o2o3

