

Build a gallery photo from the current directory (that contains images)

    FOLDER_NAME=my_trip
    FOLDER_SINK=photos

    # Static site generator
    thumbsup --input ./ --output ./$FOLDER_NAME

    # Push to neocities
    mkdir $FOLDER_SINK
    mv $FOLDER_NAME $FOLDER_SINK
    # Remove all images as they have been copied
    rm -f *

    # copy the folder to neocities.
	export NEOCITIES_KEY=$(shell cat ${HOME}/src/config/credentials/adrien-dulac.neocities)
	neocities push . 
