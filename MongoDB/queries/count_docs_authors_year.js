DBQuery.shellBatchSize = 7000000;

db.dblp.aggregate(
	[
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
