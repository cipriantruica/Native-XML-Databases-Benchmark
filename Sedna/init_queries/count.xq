let $coll := doc("dblp")
let $db := $coll/dblp
let $q0 := count($db/*)
return $q0
