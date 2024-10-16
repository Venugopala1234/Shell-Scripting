#!/bin/bash

date
ls /var/run/apache2/apache2.pid


if [ $? -eq 0 ]
then
	echo "Apache2 process is running"
else 
	echo "Apache2 process is not running"
	echo "Starting the process"
	sudo systemctl start apache2
	if [ $? -eq 0 ]
	then
		echo "Process started successfully"
	else
		echo "process Started failing, Please contact admin."
	fi
fi
		
