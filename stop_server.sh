#!/bin/bash

running_servers=$(ps aux | grep jettyRun | grep -v grep)

if [ -n "$running_servers" ]; then
	echo -e "Running server is: \n $running_servers"
fi

pids=$(echo "$running_servers" | awk '{print $2}') 

if [ -n "$pids" ]; then
	echo -e "\n about to kill the following ($pids)"
	kill -9 $pids
else
	echo "no running servers"
fi


