docker start/restart

    docker run -d -p 27017:27017 -v ~/src/data/mongo-docker:/data/db mongo

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
