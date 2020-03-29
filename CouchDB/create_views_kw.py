import couchdb

dbhost = "127.0.0.1"
dbport = "5984"
basedbname = "dblpdb"

couchserver = couchdb.Server("http://%s:%s/" % (dbhost, dbport))

mapper_1 = """function(doc) { if (doc.title.match(/database/i) || doc.title.match(/text/i) || doc.title.match(/mining/i)) {for(var idx in doc.author) { emit(doc.author[idx], 1); }}}"""
reducer_1 = """function(keys, values, rereduce){return sum(values);}"""
# design_1 = { 'views': { 'count_all_authors': { 'map': mapper_1, 'reduce': reducer_1 } } }
design_1 = { 'views': { 'count_all_authors_year_kw1o2o3': { 'map': mapper_1, 'reduce': "_sum" } } }

mapper_2 = """function(doc) { if (doc.title.match(/database/i) && doc.title.match(/text/i) && doc.title.match(/mining/i)) {for(var idx in doc.author) { emit([doc.author[idx],doc.year], 1); }}}"""
reducer_2 = """function(keys, values, rereduce){return sum(values);}"""
# design_2 = { 'views': { 'count_all_authors_year': { 'map': mapper_2, 'reduce': reducer_2 } } }
design_2 = { 'views': { 'count_all_authors_year_kw1a2a3': { 'map': mapper_2, 'reduce': "_sum" } } }


for i in range(4):
    dbno = str(2**i)
    dbname = basedbname + dbno
    db = couchserver[dbname]
    print(dbname)
    db["_design/count_all_authors_year_kw1o2o3"] = design_1
    db["_design/count_all_authors_year_kw1a2a3"] = design_2
    # just for testing
    results = db.view('count_all_authors_year_kw1o2o3/count_all_authors_year_kw1o2o3', reduce=True, group=True)
    results = db.view('count_all_authors_year_kw1a2a3/count_all_authors_year_kw1a2a3', reduce=True, group=True)