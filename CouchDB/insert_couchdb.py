import json 
import couchdb

dbhost = "127.0.0.1"
dbport = "5984"
basedbname = "dblpdb"
basefilename = '/data/DATA_SETS/dblp/'

couchserver = couchdb.Server("http://%s:%s/" % (dbhost, dbport))


for i in reversed(range(4)):
    dbno = str(2**i)
    dbname = basedbname + dbno

    filename = ('%s/dblp%s.json'% (basefilename, dbno))
    if dbname in couchserver:
        db = couchserver[dbname]
    else:
        db = couchserver.create(dbname)

    with open(filename, 'rU') as fp:
        for line in fp:
            obj = json.loads(line)
            db.save(obj)

