#!/bin/bash

function show_usage {
	echo "Using:$0 sourse_dir dest_dir"
	exit 1
}

if [ $# -ne 2 ];then
	show_usage
else
	if [ -d $1 ]; then
		souce_dir=$1
	else
	    	echo "Error!\n"
		show_usage
	fi
	if [ -d $2]; then
		dest_dir=$2
	else
		echo "Error!\n"
                show_usage
	fi
fi

echo "Sorce:${source_dir}\n"
echo "Sorce:${dest_dir}\n"

