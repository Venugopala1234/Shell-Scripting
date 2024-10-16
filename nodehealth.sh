#!/bin/bash

############################
#author: venu
#Date 28/08/24
#
#
#this script is used check health of the node 
#
###########
#
set -x # debug mode
set -e # exit the script when there is an error
set -o pipefail
echo "##########################################"

echo "print the disk space"
df -h 

echo "#########################################"
echo "Print the memory"
free -g 

echo "#########################################"
echo "print the cpu"
nproc

echo "#############################################"
echo "processos running in baground"
ps -ef | grep "amazon" | awk -F" " '{print $2}'
