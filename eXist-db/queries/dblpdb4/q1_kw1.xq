xquery version "3.1";

let $coll := collection(/db/dblpdb4)
let $db := $coll/dblp
let $kw1 := 'database'
let $q1_kw1 := $db//title[contains(lower-case(.), $kw1)]
return $q1_kw1
