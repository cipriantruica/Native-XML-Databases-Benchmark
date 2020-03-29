let $db := dblp
let $kw1 := 'database'
let $kw2 := 'text'
let $kw3 := 'mining'
let $q0 := count($db/*)
let $q1_kw1 := count($db//title[contains(lower-case(.), $kw1)])
let $q1_kw2 := count($db//title[contains(lower-case(.), $kw2)])
let $q1_kw3 := count($db//title[contains(lower-case(.), $kw3)])
let $q2_kw1o2 := count($db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw2)])
let $q2_kw1a2 := count($db//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw2)])
let $q2_kw1o3 := count($db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw3)])
let $q2_kw1a3 := count($db//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw3)])
let $q2_kw2o3 := count($db//title[contains(lower-case(.), $kw2)  or contains(lower-case(.), $kw3)])
let $q2_kw2a3 := count($db//title[contains(lower-case(.), $kw2) and contains(lower-case(.), $kw3)])
let $q3_kw1o2o3 := count($db//title[contains(lower-case(.), $kw1)  or contains(lower-case(.), $kw2)  or contains(lower-case(.), $kw3)])
let $q3_kw1a2a3 := count($db//title[contains(lower-case(.), $kw1) and contains(lower-case(.), $kw2) and contains(lower-case(.), $kw3)])

return 
<result>
    <q0> {$q0} </q0>
    <q1_kw1> {$q1_kw1} </q1_kw1>
    <q1_kw2> {$q1_kw2} </q1_kw2>
    <q1_kw3> {$q1_kw3} </q1_kw3>
    <q2_kw1o2> {$q2_kw1o2} </q2_kw1o2>
    <q2_kw1a2> {$q2_kw1a2} </q2_kw1a2>
    <q2_kw1o3> {$q2_kw1o3} </q2_kw1o3>
    <q2_kw1a3> {$q2_kw1a3} </q2_kw1a3>
    <q2_kw2o3> {$q2_kw2o3} </q2_kw2o3>
    <q2_kw2a3> {$q2_kw2a3} </q2_kw2a3>
    <q3_kw1o2o3> {$q3_kw1o2o3} </q3_kw1o2o3>
    <q3_kw1a2a3> {$q3_kw1a2a3} </q3_kw1a2a3>
</result>
