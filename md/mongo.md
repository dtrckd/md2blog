start/restart (docker)

    docker run -d -p 27017:27017 -v ~/src/data/mongo-docker:/data/db --net host --name mongodb mongo:4.2 

launch mongo terminal (docker)

    docker exec -it mongodb mongo
    #docker exec -it mongodb bash


limit memory (cache) use by mongodb:

	# (config file) Where and how to store data.
	storage:
	  dbPath: /var/lib/mongodb
	  journal:
		enabled: true
	  wiredTiger:
		engineConfig:
			cacheSizeGB: 1
	...

Status command:

    db.serverStatus() # db.serverStatus().mem , for ex
    db.colname.stats() # full col stats
    db.colname.totalIndexSize()

count duplicate in a field

	m = function () {
		emit(this.my_field, 1);
	}
	r = function (k, vals) {
	   return Array.sum(vals);
	}
	res = db.MyCollection.mapReduce(m,r, { out : "my_output" });
	db[res.result].find({value: {$gt: 1}});


dump/restore

* dump a collection only (--forceTableScan prevenet the following error: `Failed: error writing data for collection "mycol" to disk: error reading collection: Failed to parse: [...]`)

    mongodump -d mydb -c mycol --forceTableScan --gzip -o dumpout/

* restore that collection

     mongorestore -d mydb2  [-c mycol] --gzip win32_doc/doc/win32.bson.gz



Iterate a results

```
// Get the docs
docs = db.find({user:1000})
// Init common values of the new doc
new_doc = db.findOne({user:1000}) 
// Remove the unused field in the new object
delete new_doc.field
delete new_doc.data 
for (i=0; i<docs.size(); i++){
    doc = docs[i]
    new_doc[doc["field"]] = new_doc["data"]
    if (Date(doc["timestamp"]) > Date(new_doc["timestamp"])) {
        new_doc["timestamp"] = doc["timestamp"]
    }
}
// remove all references to the user if you need to
db.remove({user:1000}, {multi:true})
// insert the merged document
db.insert(new_doc)
```
