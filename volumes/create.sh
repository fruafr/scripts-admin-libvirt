#!/bin/bash
# create
# Creates a volume in a given pool using virsh
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Creates a volume in a given pool using virsh"
   echo "Takes four arguments : pool name, volume name, capacity, format"
   echo "Capacity: e.g. 10G"
   echo "Format: raw, qcow2"
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

if [[ $# -ne 4 ]]; then
  echo "Error: Four arguments (pool name, volume name, capacity and format) are required. Use -h for help."
  exit 1
fi

################################################################################
# Main program                                                                 #
################################################################################
POOL_NAME=$1
VOL_NAME=$2
CAPACITY=$3
FORMAT=$4

# Pool Name
echo "The pool name is $POOL_NAME"
# Volume Name
echo "The desired volume name is $VOL_NAME"
# Check the capacity
if [[ $CAPACITY =~ ^[0-9]+G$ ]]; then
    echo "The desired capacity is $CAPACITY"
else
    echo "The capacity format is incorrect. Must be decimal with G. e.g. 10G"
fi
# Check the format
if [[ $FORMAT == 'raw' || $FORMAT == 'qcow2' ]]; then
   echo "The desired format is $FORMAT"
else
   echo "The desired format is incorrect. Must be raw or qcow2"
fi

##
## Main program
##

# Case raw
if [[ $FORMAT == 'raw' ]]; then
  virsh vol-create-as $POOL_NAME $VOL_NAME $CAPACITY --format raw
fi

# Case qcow2 thin-provisioning
if [[ $FORMAT == 'qcow2' ]]; then
  virsh vol-create-as $POOL_NAME $VOL_NAME $CAPACITY --format qcow2 --allocation 0 --prealloc-metadata
fi

# Verify the volume
virsh vol-info --pool $POOL_NAME $VOL_NAME

# Refresh the pool
virsh pool-refresh $POOL_NAME

echo "Task completed $VOL_NAME created in $POOL_NAME"
