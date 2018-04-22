#!/bin/bash

ITERATION=0

echo "Archive-Project"
echo ""

if [ -n "$1" ]
then
	if [ ! -d "./Archive" ]
	then
		echo "CREATING FOLDER : Archive"
		mkdir Archive
		echo "DONE"
	fi

	if [ ! -e "./Archive/.iteration.txt" ]
	then
		echo "CREATING FILE : .iteration.txt"
		touch ./Archive/.iteration.txt
		echo "0" > .iteration.txt
		echo "DONE"
	fi

	while read f  
	do
		ITERATION=$f
	done < ./Archive/.iteration.txt

	expr $ITERATION + 1 > ./Archive/.iteration.txt

	echo "ARCHIVING"
	zip -r ./Archive/"ARCHIVE_$ITERATION" $1/*
	echo "DONE"
else
	echo "ERROR : NO INPUT FOLDER"
fi
