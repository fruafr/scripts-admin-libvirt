#!/bin/bash
# netadd.sh
# Setup and start a libvirt network. Set to autostart. Requires path to xml config file
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
   echo "Setup and start a libvirt network. Set to autostart. Requires path to xml config file"
   echo "Take two arguments: network name, path to xml config file"
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
  echo "Error: Two arguments are required: network name, path to xml config file. Use -h for help."
  exit 1
fi

#############################
# Main program              #
#############################

NETWORK=$1
XMLFILE=$2

echo 'Libvirt/KVM - Setup and start a libvirt network - Task starting ...'

echo "importing $XMLFILE for network $NETWORK ..."
sudo virsh net-define $XMLFILE
echo "$XMLFILE imported successfully for network $NETWORK"

sudo virsh net-autostart $NETWORK
echo "$NETWORK set to autostart"

echo "$NETWORK starting ..."
sudo virsh net-start $NETWORK
echo "$NETWORK started ..."

echo 'Libvirt/KVM - Setup and start a libvirt network - Task completed ...'