DBQuery.shellBatchSize = 7000000;
db.dblp.find({ $and: [{ title: /text/i }, { title: /mining/i }]}, {title: 1, _id: 0})
