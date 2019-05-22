
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
