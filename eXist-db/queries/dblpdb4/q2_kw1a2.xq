xquery version "3.1";

let $coll := collection(/db/dblpdb4)
let $db := $coll/dblp
let $kw1 := 'database'
let $kw2 := 'text'
let $q2_kw1a2 := $db//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw2)]
return $q2_kw1a2
