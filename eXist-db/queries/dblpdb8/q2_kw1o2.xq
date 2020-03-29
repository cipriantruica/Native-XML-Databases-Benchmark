xquery version "3.1";

let $coll := collection(/db/dblpdb8)
let $db := $coll/dblp
let $kw1 := 'database'
let $kw2 := 'text'
let $q2_kw1o2 := $db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw2)]
return $q2_kw1o2
