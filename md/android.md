@recipe
@android

# getting file trough MTP.

install `mtp-tools`

see files:
    mtp-files > file_list.txt

get a file(filename and parent id sould be get from the file_list.):
    mtp-getfile "ID" "PARENT_ID/FILENAME"
