#!/bin/bash
# netdel.sh
# Stop and remove a libvirt network
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

set -e

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Stop and remove a libvirt network"
   echo "Take one argument: network name"
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

if [[ $# -ne 1 ]]; then
  echo "Error: one argument is required: network name. Use -h for help."
  exit 1
fi

#############################
# Main program              #
#############################

NETWORK=$1

echo "Libvirt/KVM - Stop and remove the libvirt network $NETWORK - Task starting ..."

echo "Stopping $NETWORK"
sudo virsh net-destroy $NETWORK
echo "$NETWORK stopped successfully"

echo "Removing $NETWORK"
sudo virsh net-undefine $NETWORK
echo "$NETWORK removed successfully"

echo "Libvirt/KVM - Stop and remove the libvirt network $NETWORK - Task completed ..."
