import couchdb

dbusername = "admin"
dbpassword = "admin"
dbhost = "127.0.0.1"
dbport = "5984"
dbname = "dblpdb8"

couchserver = couchdb.Server("http://%s:%s@%s:%s/" % (dbusername, dbpassword, dbhost, dbport))
db = couchserver[dbname]

mapper = """function(doc) { for(var idx in doc.author) { emit(doc.author[idx], 1); }}"""
reducer = """function(keys, values, rereduce){return sum(values);}"""
# design = { 'views': { 'count_all_authors': { 'map': mapper, 'reduce': reducer } } }
design = { 'views': { 'count_all_authors': { 'map': mapper, 'reduce': '_sum' } } }

db["_design/count_all_authors"] = design

mapper = """function(doc) { for(var idx in doc.author) { emit([doc.author[idx],doc.year], 1); }}"""
reducer = """function(keys, values, rereduce){return sum(values);}"""
# design = { 'views': { 'count_all_authors_year': { 'map': mapper, 'reduce': reducer } } }
design = { 'views': { 'count_all_authors_year': { 'map': mapper, 'reduce': '_sum' } } }

db["_design/count_all_authors_year"] = design


# results = db.view('count_all_authors/count_all_authors', reduce=True, group=True)

