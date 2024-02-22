#!/bin/bash
# delete.sh
# Deletes a volume in a given pool using virsh
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Deletes a volume in a given pool using virsh"
   echo "Takes two arguments : pool name, volume name"
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
  echo "Error: Two arguments (pool name, volume name) are required. Use -h for help."
  exit 1
fi

################################################################################
# Main program                                                                 #
################################################################################
POOL_NAME=$1
VOL_NAME=$2

# Pool Name
echo "The pool name is $POOL_NAME"
# Volume Name
echo "The volume name is $VOL_NAME"

# Delete the volume
virsh vol-delete --pool $POOL_NAME $VOL_NAME

# Verify the volume
virsh vol-info --pool $POOL_NAME $VOL_NAME

# Refresh the pool
virsh pool-refresh $POOL_NAME

echo "Task completed $VOL_NAME deleted from $POOL_NAME"
