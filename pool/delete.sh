#!/bin/bash
# delete.sh
# Deletes a pool with a directory using virsh
# Author: David Heurtevent <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Deletes a pool with a directory using virsh"
   echo "Takes two arguments : the pool name and the pool directory path"
   echo "WARNING : Deletes the directory content !!!!"
}

#################################
# Options and arguments         #
#################################

if [[ $1 == "--help" ]]; then
    # display Help
    Help
    exit
fi

# Get the options
while getopts ":h" option; do
   case $option in
     h) # display Help
         Help
         exit;;
     /?) # incorrect option
         echo "Error: Invalid option"
         exit;;
   esac
done

if [[ $# -ne 2 ]]; then
  echo "Error: Two arguments (pool name and directory) are required. Use -h for help."
  exit 1
fi

################################################################################
# Main program                                                                 #
################################################################################
POOL_NAME=$1
DIRECTORY=$2

echo "Pool name is $1"
echo "Directory is $2"

echo 'List the pools'
virsh pool-list --all

echo 'Destroy (stop) the pool'
virsh pool-destroy $POOL_NAME

echo 'Delete the directory and its content'
rm -rf $DIRECTORY

echo 'Delete the pool'
virsh pool-delete $POOL_NAME

echo 'Remove the pool (undefine)'
virsh pool-undefine $POOL_NAME

echo 'List the pools'
virsh pool-list --all

echo 'Check that the pool directory no longer exist'
ls -al $DIRECTORY

echo "Task completed - $POOL_NAME removed"
