#!/bin/sh

if [ "$#" -eq 2 ]; then
	python3 /usr/local/app/main.py -i $1 -p $2
elif [ "$#" -eq 3 ]; then
	# Stay up for container to stay alive
	python3 /usr/local/app/main.py -i $1 -p $2
	while [ 1 ] ; do
	   sleep 1d
	done
else
	# Stay up for container to stay alive
	while [ 1 ] ; do
	   sleep 1d
	done
fi
