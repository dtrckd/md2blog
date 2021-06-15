
# files

`csv`

https://www.tutorialspoint.com/How-to-save-a-Python-Dictionary-to-CSV-file

	import csv
	csv_columns = ['No','Name','Country']
	dict_data = [
	{'No': 1, 'Name': 'Alex', 'Country': 'India'},
	{'No': 2, 'Name': 'Ben', 'Country': 'USA'},
	{'No': 3, 'Name': 'Shri Ram', 'Country': 'India'},
	{'No': 4, 'Name': 'Smith', 'Country': 'USA'},
	{'No': 5, 'Name': 'Yuva Raj', 'Country': 'India'},
	]
	csv_file = "Names.csv"
	try:
		with open(csv_file, 'w') as csvfile:
			writer = csv.DictWriter(csvfile, fieldnames=csv_columns)
			writer.writeheader()
			for data in dict_data:
				writer.writerow(data)
	except IOError:
		print("I/O error")


`os.walk`

	import os

	root = os.path.join('..', 'food')
	for directory, subdir_list, file_list in os.walk(root):
		print('Directory:', directory)
		for name in subdir_list:
			print('Subdirectory:', name)
		for name in file_list:
			print('File:', name)
		print()

`os.path`

	os.path.join(path1, path2) join path.
    os.path.abspath(path) get absolute path.
    os.path.basename(path) get the filename excluding the directory part. Opposite of os.path.dirname which excludes filename part and returns directory path.
    os.path.exists(path) returns True if path exists else False.
    os.path.getsize(path) return size (in bytes) for a given path.
    os.path.isfile(path), os.path.isdir(path) returns True or False if path is file or a directory.
    os.path.getctime(path), os.path.getmtime(path) Similar to os.stat(path).ctime, os.stat(path).mtime()
	os.rename ...

	shutil.which(path) -> return binary path if executable, else None

