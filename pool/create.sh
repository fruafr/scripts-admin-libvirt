#!/bin/bash
# create.sh
# Creates a pool with a directory using virsh
# Documentation : https://access.redhat.com/documentation/fr-fr/red_hat_enterprise_linux/6/html/virtualization_administration_guide/sect-virtualization-storage_pools-creating-local_directories-virsh
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-15
# License: MIT

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Creates a pool with a directory using virsh"
   echo "Takes two arguments : the pool name and the pool directory path"
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
echo "Directory will be $2"

echo "Create the storage pool definition"
virsh pool-define-as $POOL_NAME dir - - - - "$DIRECTORY"

echo "Verify the storage pool is listed"
virsh pool-list --all

echo "Create the local directory"
virsh pool-build $POOL_NAME
mkdir -p $DIRECTORY
ls -al $DIRECTORY

echo "Start the storage pool"
virsh pool-start $POOL_NAME

echo "Verify the storage pool is active"
virsh pool-list --all

echo "Turn on autostart"
virsh pool-autostart $POOL_NAME

echo "Verify the storage pool has autostart on"
virsh pool-list --all

echo "Verify the storage pool configuration"
virsh pool-info $POOL_NAME

ls -al $DIRECTORY

echo "Configuration of $POOL_NAME completed"
