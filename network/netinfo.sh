#!/bin/bash
# netinfo.sh
# Display libvirt network information
# Author: David HEURTEVENT <david@heurtevent.org>
# Date: 2024-02-22
# License: MIT

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Display libvirt network information"
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

echo "Libvirt/KVM - information on the network $NETWORK :"
echo ''
sudo virsh net-info $NETWORK