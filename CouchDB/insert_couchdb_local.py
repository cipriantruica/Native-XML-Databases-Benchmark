import json 
import couchdb
import sys

dbusername = sys.argv[1]
dbpassword = sys.argv[2]
dbhost = "127.0.0.1"
dbport = "5984"
dbnames = "dblpdb8"
filename = '/home/sheepman/DATA_SETS/dblp/dblpdb8/dblp8.json'

couchserver = couchdb.Server("http://%s:%s@%s:%s/" % (dbusername, dbpassword, dbhost, dbport))

if dbname in couchserver:
    db = couchserver[dbname]
else:
    db = couchserver.create(dbname)


with open(filename, 'rU') as fp:
    for line in fp:
        obj = json.loads(line)
        db.save(obj)

