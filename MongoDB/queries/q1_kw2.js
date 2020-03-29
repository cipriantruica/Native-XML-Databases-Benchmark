DBQuery.shellBatchSize = 7000000;
db.dblp.find({ title: /text/i }, {title: 1, _id: 0})
