DBQuery.shellBatchSize = 7000000;

db.dblp.aggregate(
	[
		{ $unwind: "$author" },
		{ $project: { "author": "$author"}},
		{
			$group: {
				"_id": "$author",
				"count": {"$sum": 1}
			}
		},
		{ $sort: {"count" : -1}},
	], { allowDiskUse: true } 
)
