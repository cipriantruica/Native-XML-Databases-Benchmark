DBQuery.shellBatchSize = 7000000;
db.dblp.find({  $or: [{ title: /database/i }, { title: /text/i } ]}, {title: 1, _id: 0})
