DBQuery.shellBatchSize = 7000000;

db.dblp.aggregate(
	[
		{ $match: { $and: [{ title: /database/i }, { title: /text/i }, { title: /mining/i }]}}, 
		{ $unwind: "$author" },
		{ $project: { "author": "$author", "year": "$year"}},
		{
			$group: {
				"_id": {auhtor: "$author", year: "$year"},
				"count": {"$sum": 1}
			}
		},
		{ $sort: {"count" : -1}},
	], { allowDiskUse: true } 
)
